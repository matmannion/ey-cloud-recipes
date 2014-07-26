require 'pp'
#
# Cookbook Name:: ssmtp
# Recipe:: default
#

if ['solo', 'app', 'util', 'app_master'].include?(node[:instance_role])

  directory "/etc/ssmtp" do
    recursive true
    action :delete
  end

  directory "/data/ssmtp" do
    owner "root"
    group "root"
    mode "0755"
    action :create
    not_if "test -d /data/ssmtp"
  end

  link "/etc/ssmtp" do
    to '/data/ssmtp'
  end

  # Install the ssmtp.conf file.
  template '/data/ssmtp/ssmtp.conf' do
    owner node[:owner_name]
    group node[:owner_name]
    source 'ssmtp.conf.erb'
  end

end
