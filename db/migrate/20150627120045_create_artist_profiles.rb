class CreateArtistProfiles < ActiveRecord::Migration
  def change
    create_table(:artist_profiles) do |t|
      t.references :artist
      t.text :biography, default: ""
      t.string :genre, default: ""
      t.string :location, default: ""
      t.string :members, default: ""
      t.string :facebook_url, default: ""
      t.string :twitter_url, default: ""
      t.string :youtube_url, default: ""
      t.string :itunes_url, default: ""
      t.string :amazon_url, default: ""
      t.string :google_play_url, default: ""
      t.string :ticketfly_url, default: ""
      t.string :record_label, default: ""
      t.string :cover_image, default: ""
      t.string :profile_image, default: ""

      t.timestamps
    end

    add_index :artist_profiles, :artist_id, unique: true
  end
end
