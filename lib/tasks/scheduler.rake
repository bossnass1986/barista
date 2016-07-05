desc 'These tasks are called by the Heroku scheduler add-on'
task :expire_credits => :environment do
  puts "#{DateTime.now} INFO - commence credit expire".upcase
  result = StoreCredit.expire_credits!
  message = "#{DateTime.now} INFO - credit expire completed - #{result} #{"record".pluralize(result)} updated".upcase
  puts message
  subject = 'Credit Expiry'
  Notifier.mail_alert(subject, message).deliver_now
end

task :assign_referrals => :environment do
  puts "#{DateTime.now} INFO - commence referral checks".upcase
  result = Referral.assign_credits!
  puts "#{DateTime.now} INFO - credit expire completed - #{result} #{"record".pluralize(result)} updated".upcase
end

task :send_reminders => :environment do
  User.all.each do |user|
    Notifier.referral_inviteheroku(user).deliver_now
  end
end