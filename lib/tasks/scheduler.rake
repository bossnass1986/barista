desc 'These tasks are called by the Heroku scheduler add-on'
task :expire_credits => :environment do
  puts "Expiring unused credits..."
  StoreCredit.expire_credits
  puts "done."
end

task :send_reminders => :environment do
  User.send_reminders
end