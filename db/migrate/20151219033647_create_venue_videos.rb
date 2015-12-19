class CreateVenueVideos < ActiveRecord::Migration
  def change
    create_table(:venue_videos) do |t|
      t.references :venue
      t.string :title
      t.text :description
      t.string :youtube_url
      t.string :slug

      t.timestamps
    end

    add_index :venue_videos, :venue_id
  end
end
