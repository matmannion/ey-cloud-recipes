ey_cloud_report "Tripwire" do
  message "configuring tripwire"
end

# Install the twcfg.txt file.
template '/etc/tripwire/twcfg.txt' do
	owner node[:owner_name]
	group node[:owner_name]
	source 'twcfg.txt.erb'
end

# Use mktwpol to generate the twpol.txt policy file
remote_file "/tmp/mktwpol-0.2.4.tar.gz" do
		source "mktwpol-0.2.4.tar.gz"
		action :create_if_missing
		mode 0644
end

execute "install mktwpol" do
		command "tar -zxvf /tmp/mktwpol-0.2.4.tar.gz mktwpol-0.2.4/"
		cwd "/data/"
end

# Create rules file. Must be mode 600 and owned by root else mktwpol won't run
template '/data/mktwpol-0.2.4/mktwpol-engineyard.rules' do
	owner "root"
	group "root"
	source 'mktwpol-engineyard.rules.erb'
	variables(
		:tripwire_emailto => node[:tripwire_emailto]
	)
	mode 0600
end

# Create the twpol.txt file
execute "create tripwire policy file from rules" do
	command "sudo /data/mktwpol-0.2.4/mktwpol-0.2.4.sh -R /data/mktwpol-0.2.4/mktwpol-engineyard.rules > /etc/tripwire/twpol.txt"
	cwd "/etc/tripwire"
end

# Install the twinstall.sh file.
template '/etc/tripwire/twinstall.sh' do
	owner node[:owner_name]
	group node[:owner_name]
	source 'twinstall.sh.erb'
	variables(
		:tripwire_site_passphrase => node[:tripwire_site_passphrase],
		:tripwire_local_passphrase => node[:tripwire_local_passphrase]
	)
	mode 0755
end

# Run the install file to generate keys
execute "generate tripwire keys" do
	cwd "/etc/tripwire"
	command "/etc/tripwire/twinstall.sh"
end

# If the database hasn't been generated yet, generate it

# Recreate and sign the policy file
execute "recreate tripwire policy file" do
	cwd "/etc/tripwire"
	command "/usr/sbin/twadmin -m P -Q #{node[:tripwire_site_passphrase]} /etc/tripwire/twpol.txt"
end

# Initialise Tripwire to re-read the policy file
execute "generate tripwire database" do
	cwd "/etc/tripwire"
	command "/usr/sbin/tripwire --init -P #{node[:tripwire_local_passphrase]}"
#/var/lib/tripwire/ip-172-31-42-172.twd
end