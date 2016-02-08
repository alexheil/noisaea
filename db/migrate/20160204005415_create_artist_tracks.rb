class CreateArtistTracks < ActiveRecord::Migration
  def change
    create_table(:artist_tracks) do |t|
      t.references :artist
      t.references :artist_album
      t.string :title
      t.integer :number
      t.integer :price
      t.string :currency
      t.string :track_url
      t.text :lyrics
      t.string :slug

      t.timestamps
    end

    add_index :artist_tracks, :artist_id
    add_index :artist_tracks, :artist_album_id
    add_index :artist_tracks, :number
  end
end
