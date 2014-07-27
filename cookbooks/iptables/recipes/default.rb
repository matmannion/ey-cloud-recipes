#
# Cookbook Name:: iptables
# Recipe:: default
#

if ['solo', 'app', 'util', 'app_master', 'db_master', 'db_slave'].include?(node[:instance_role])
	include_recipe "iptables::install"
	include_recipe "iptables::config"

	# Start the iptables service
	execute "start iptables" do
		command "sudo rc-service iptables start"
	end
end