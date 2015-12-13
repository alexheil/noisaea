class CreateVenueShows < ActiveRecord::Migration
  def change
    create_table(:venue_shows) do |t|
      t.references :venue
      t.string :artist
      t.integer :month
      t.integer :day
      t.integer :year
      t.string :show_venue
      t.string :location
      t.text :description
      t.string :ticket_url
      t.string :flyer_url

      t.timestamps
    end

    add_index :venue_shows, :venue_id
  end
end
