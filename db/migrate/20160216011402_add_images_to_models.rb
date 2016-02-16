class AddImagesToModels < ActiveRecord::Migration
  def change
    add_attachment :artist_profiles, :cover_img
    add_attachment :artist_profiles, :profile_img
    add_attachment :artist_shows, :flyer_img
    add_attachment :artist_merches, :item_img
    add_attachment :artist_albums, :cover_img

    add_attachment :record_label_profiles, :cover_img
    add_attachment :record_label_profiles, :profile_img
    add_attachment :record_label_shows, :flyer_img

    add_attachment :venue_profiles, :cover_img
    add_attachment :venue_profiles, :profile_img
    add_attachment :venue_shows, :flyer_img

    add_attachment :producer_profiles, :cover_img
    add_attachment :producer_profiles, :profile_img

    add_attachment :fan_profiles, :cover_img
    add_attachment :fan_profiles, :profile_img

  end
end
