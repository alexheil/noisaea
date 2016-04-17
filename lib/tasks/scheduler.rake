desc "Heroku scheduler tasks"
task :artist_notifications_cleanup => :environment do
  puts "Delete all old artist notifications."
  ArtistNotification.notification_cleanup
  puts "Artist notifications deleted!"
end
task :artist_lazy_mailer => :environment do
  puts "Send email to lazy artists."
  Artist.lazy_mailer
  puts "Artist email sent!"
end
task :fan_lazy_mailer => :environment do
  puts "Send email to lazy fans."
  Fan.lazy_mailer
  puts "Lazy fan email sent!"
end
task :fan_follow_mailer => :environment do
  puts "Send email to lazy fans."
  Fan.follow_mailer
  puts "Lazy fan email sent!"
end
task :artist_merch_need_to_pay_mailer => :environment do
  puts "Send email to fans who need to pay for artist merch."
  ArtistMerchPurchase.artist_merch_need_to_pay_mailer
  puts "Artist purchase mail sent!"
end
