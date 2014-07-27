if ['solo', 'app', 'util', 'app_master', 'db_master', 'db_slave'].include?(node[:instance_role])
  # Install the /etc/profile file.
  template '/etc/profile.d/email-on-login.sh' do
    source 'email-on-login.sh.erb'
    mode 0755
    variables(
      :login_notification_email => node[:login_notification_email]
    )
  end
end
