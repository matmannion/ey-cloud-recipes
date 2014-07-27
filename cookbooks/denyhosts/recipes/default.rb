#
# Cookbook Name:: denyhosts
# Recipe:: default
#
# Adapted from https://github.com/phlipper/chef-denyhosts for Gentoo/EngineYard support

if ['solo', 'app', 'util', 'app_master', 'db_master', 'db_slave'].include?(node[:instance_role])
  include_recipe "denyhosts::install"
  include_recipe "denyhosts::config"

  # Start the service
  service "denyhosts" do
    supports :restart => true
    action [:enable, :start]
  end
end