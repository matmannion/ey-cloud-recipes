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
	mode 0755
	backup false
	action :create
end

#execute "plugin install #{name}" do
#	cwd "/usr/lib/elasticsearch-#{node[:elasticsearch_version]}"
#	command "/usr/lib/elasticsearch-#{node[:elasticsearch_version]}/bin/plugin -install #{name}"
#	not_if { File.directory?("/usr/lib/elasticsearch-#{node[:elasticsearch_version]}/plugins/#{name}") }
#end