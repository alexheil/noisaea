class CreateArtistShows < ActiveRecord::Migration
  def change
    create_table(:artist_shows) do |t|
      t.references :artist
      t.integer :month
      t.integer :day
      t.integer :year
      t.string :venue
      t.string :location
      t.text :description
      t.string :ticket_url
      t.string :flyer_url

      t.timestamps
    end

    add_index :artist_shows, :artist_id
  end
end
