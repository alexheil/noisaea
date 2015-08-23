class CreateProducerProfiles < ActiveRecord::Migration
  def change
    create_table(:producer_profiles) do |t|
      t.references :producer
      t.text :biography, default: ""
      t.text :artists, default: ""
      t.string :genre, default: ""
      t.string :location, default: ""
      t.string :founded, default: ""
      t.string :website, default: ""
      t.string :facebook_url, default: ""
      t.string :twitter_url, default: ""
      t.string :youtube_url, default: ""
      t.string :cover_image, default: ""
      t.string :profile_image, default: ""

      t.timestamps
    end

    add_index :producer_profiles, :producer_id, unique: true
  end
end
