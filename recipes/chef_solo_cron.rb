cron "chef_solo" do
  action node[:chef_solo][:cron] ? :create : :delete
  minute node[:chef_solo][:cron][:minute] if node[:chef_solo][:cron] && node[:chef_solo][:cron][:minute]
  hour node[:chef_solo][:cron][:hour] if node[:chef_solo][:cron] && node[:chef_solo][:cron][:hour]
  day node[:chef_solo][:cron][:day] if node[:chef_solo][:cron] && node[:chef_solo][:cron][:day]
  weekday node[:chef_solo][:cron][:weekday] if node[:chef_solo][:cron] && node[:chef_solo][:cron][:weekday]
  mailto node[:chef_solo][:cron][:mailto] if node[:chef_solo][:cron] && node[:chef_solo][:cron][:mailto]
  if node[:chef_solo][:cron] && node[:chef_solo][:cron][:log_file] then
  	command "#{node[:chef_solo][:environment_variables]} #{node[:chef_solo][:bin]} -j #{node[:chef_solo][:data_file]} -c #{node[:chef_solo][:config_file]} > #{node[:chef_solo][:cron][:log_file]} 2>&1"
  else
  	command "#{node[:chef_solo][:environment_variables]} #{node[:chef_solo][:bin]} -j #{node[:chef_solo][:data_file]} -c #{node[:chef_solo][:config_file]}"
  end
end