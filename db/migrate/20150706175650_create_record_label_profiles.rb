class CreateRecordLabelProfiles < ActiveRecord::Migration
  def change
    create_table(:record_label_profiles) do |t|
      t.references :record_label
      t.text :biography, default: ""
      t.text :artists, default: ""
      t.string :genre, default: ""
      t.string :location, default: ""
      t.string :founded, default: ""
      t.string :facebook_url, default: ""
      t.string :twitter_url, default: ""
      t.string :youtube_url, default: ""
      t.string :itunes_url, default: ""
      t.string :amazon_url, default: ""
      t.string :google_play_url, default: ""
      t.string :ticketfly_url, default: ""
      t.string :cover_image, default: ""
      t.string :profile_image, default: ""

      t.timestamps
    end

    add_index :record_label_profiles, :record_label_id, unique: true
  end
end
