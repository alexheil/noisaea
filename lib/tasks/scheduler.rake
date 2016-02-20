desc "Heroku scheduler tasks"
task :artist_notifications_cleanup => :environment do
  puts "Delete all old artist notifications."
  ArtistNotification.cleanup
  puts "Artist notifications deleted!"
end
