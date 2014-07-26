ey_cloud_report "Tripwire" do
  message "adding nightly run of Tripwire checks"
end

cron "tripwire report" do
	user     "root" # needs to run as root
	action   :create
	minute   node[:tripwire_cron_minute]
	hour     node[:tripwire_cron_hour]
	command  "/usr/sbin/tripwire --check -M"
end