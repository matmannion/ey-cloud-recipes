iptables_version = node[:iptables_version]

ey_cloud_report "iptables" do
  message "installing iptables #{iptables_version}"
end

enable_package "net-firewall/iptables" do
  version iptables_version
end

package "net-firewall/iptables" do
  version iptables_version
  action :install
end