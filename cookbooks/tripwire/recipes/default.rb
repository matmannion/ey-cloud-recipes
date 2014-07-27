#
# Cookbook Name:: tripwire
# Recipe:: default
#

if ['solo', 'app', 'util', 'app_master', 'db_master', 'db_slave'].include?(node[:instance_role])
	include_recipe "tripwire::install"
	include_recipe "tripwire::config"
	include_recipe "tripwire::cron"
end