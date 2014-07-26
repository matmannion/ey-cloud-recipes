ey_cloud_report "iptables" do
  message "configuring iptables"
end

# Save the default rules
execute "save iptables default rules" do
	command "sudo rc-service iptables save"
end