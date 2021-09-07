# every 1.day, at: '8:00am' do
every 1.minute do
  rake 'whisher:check_notifications'
end
