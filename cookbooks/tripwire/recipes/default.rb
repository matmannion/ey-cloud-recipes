#
# Cookbook Name:: tripwire
# Recipe:: default
#

if ['solo', 'app', 'util', 'app_master'].include?(node[:instance_role])
	ey_cloud_report "Tripwire" do
	  message "configuring tripwire"
	end

	include_recipe "tripwire::install"
	include_recipe "tripwire::config"
end