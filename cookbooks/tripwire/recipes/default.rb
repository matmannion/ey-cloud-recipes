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