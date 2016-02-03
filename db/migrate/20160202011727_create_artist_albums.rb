class CreateArtistAlbums < ActiveRecord::Migration
  def change
    create_table(:artist_albums) do |t|
      t.references :artist
      t.string :title
      t.text :description
      t.integer :month
      t.integer :day
      t.integer :year
      t.integer :price
      t.string :currency
      t.string :album_url
      t.string :cover_art_url
      t.string :slug

      t.timestamps
    end

    add_index :artist_albums, :artist_id
  end
end
