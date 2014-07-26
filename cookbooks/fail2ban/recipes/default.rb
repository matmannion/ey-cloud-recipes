#
# Cookbook Name:: fail2ban
# Recipe:: default
#

# Dependency on iptables
include_recipe "iptables"

if ['solo', 'app', 'util', 'app_master'].include?(node[:instance_role])
	include_recipe "fail2ban::install"
	include_recipe "fail2ban::config"

	# Start the fail2ban service
	execute "start fail2ban" do
		command "sudo rc-service fail2ban start"
	end
end