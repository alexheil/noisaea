class CreateArtistVideos < ActiveRecord::Migration
  def change
    create_table(:artist_videos) do |t|
      t.references :artist
      t.string :title
      t.text :description
      t.string :youtube_url
      t.string :slug

      t.timestamps
    end

    add_index :artist_videos, :artist_id
  end
end
