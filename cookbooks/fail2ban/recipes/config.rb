ey_cloud_report "fail2ban" do
  message "configuring fail2ban"
end

# Install the jail.conf file.
template '/etc/fail2ban/jail.conf' do
	owner node[:owner_name]
	group node[:owner_name]
	source 'jail.conf.erb'
	variables(
		:fail2ban_notification_email => node[:fail2ban_notification_email],
		:fail2ban_notification_sender => node[:fail2ban_notification_sender]
	)
end