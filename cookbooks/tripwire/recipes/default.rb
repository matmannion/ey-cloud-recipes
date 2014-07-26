#
# Cookbook Name:: tripwire
# Recipe:: default
#

ey_cloud_report "Tripwire" do
  message "configuring tripwire"
end

include_recipe "tripwire::install"

# Install the twcfg.txt file.
template '/etc/tripwire/twcfg.txt' do
	owner node[:owner_name]
	group node[:owner_name]
	source 'twcfg.txt.erb'
end

# Install the twpol.txt file.
template '/etc/tripwire/twpol.txt' do
	owner node[:owner_name]
	group node[:owner_name]
	source 'twpol.txt.erb'
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
	backup false
	action :create
end

# Run the install file to generate keys
execute "generate tripwire keys" do
	cwd "/etc/tripwire"
	command "/etc/tripwire/twinstall.sh"
end