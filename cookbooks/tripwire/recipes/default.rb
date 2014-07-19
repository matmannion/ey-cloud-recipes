#
# Cookbook Name:: tripwire
# Recipe:: default
#

ey_cloud_report "Tripwire" do
  message "configuring tripwire"
end

include_recipe "tripwire::install"