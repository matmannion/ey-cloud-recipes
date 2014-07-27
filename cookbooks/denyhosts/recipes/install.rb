denyhosts_version = node[:denyhosts][:version]

ey_cloud_report "denyhosts" do
  message "installing denyhosts #{denyhosts_version}"
end

enable_package "app-admin/denyhosts" do
  version denyhosts_version
end

package "app-admin/denyhosts" do
  version denyhosts_version
  action :install
end