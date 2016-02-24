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
