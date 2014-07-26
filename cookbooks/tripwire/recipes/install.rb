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

# Use mktwpol to generate the twpol.txt policy file
cookbook_file "/tmp/mktwpol-0.2.4.tar.gz" do
	source "mktwpol-0.2.4.tar.gz"
	action :create_if_missing
	mode 0644
end

execute "install mktwpol" do
	command "tar -zxvf /tmp/mktwpol-0.2.4.tar.gz mktwpol-0.2.4/"
	cwd "/data/"
end