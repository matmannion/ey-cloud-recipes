tripwire_version = node[:tripwire_version]

ey_cloud_report "Tripwire" do
  message "installing tripwire #{tripwire_version}"
end

enable_package "app-admin/tripwire" do
  version tripwire_version
end

package "app-admin/tripwire" do
  version tripwire_version
  action :install
end
