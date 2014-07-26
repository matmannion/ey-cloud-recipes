fail2ban_version = node[:fail2ban_version]
gamin_version = node[:gamin_version]

ey_cloud_report "fail2ban" do
  message "installing fail2ban #{fail2ban_version}"
end

# Also install gamin
enable_package "app-admin/gamin" do
  version gamin_version
end

package "app-admin/gamin" do
  version gamin_version
  action :install
end

enable_package "net-analyzer/fail2ban" do
  version fail2ban_version
end

package "net-analyzer/fail2ban" do
  version fail2ban_version
  action :install
end