class CreateVenueProfiles < ActiveRecord::Migration
  def change
    create_table :venue_profiles do |t|
      t.references :venue
      t.text :biography, default: ""
      t.string :location, default: ""
      t.string :founded, default: ""
      t.string :facebook_url, default: ""
      t.string :twitter_url, default: ""
      t.string :youtube_url, default: ""
      t.string :ticketfly_url, default: ""
      t.string :cover_image, default: ""
      t.string :profile_image, default: ""

      t.timestamps
    end

    add_index :venue_profiles, :venue_id, unique: true
  end
end
