class AddDetailsToShows < ActiveRecord::Migration
  def change
    add_column :artist_shows, :headline_artist, :string, default: ""
    add_column :artist_shows, :support_artist1, :string, default: ""
    add_column :artist_shows, :support_artist2, :string, default: ""
    add_column :artist_shows, :support_artist3, :string, default: ""
    add_column :artist_shows, :support_artist4, :string, default: ""
    add_column :artist_shows, :support_artist5, :string, default: ""
    add_column :artist_shows, :support_artist6, :string, default: ""
    add_column :artist_shows, :support_artist7, :string, default: ""

    add_column :record_label_shows, :headline_artist, :string, default: ""
    add_column :record_label_shows, :support_artist1, :string, default: ""
    add_column :record_label_shows, :support_artist2, :string, default: ""
    add_column :record_label_shows, :support_artist3, :string, default: ""
    add_column :record_label_shows, :support_artist4, :string, default: ""
    add_column :record_label_shows, :support_artist5, :string, default: ""
    add_column :record_label_shows, :support_artist6, :string, default: ""
    add_column :record_label_shows, :support_artist7, :string, default: ""

    add_column :venue_shows, :headline_artist, :string, default: ""
    add_column :venue_shows, :support_artist1, :string, default: ""
    add_column :venue_shows, :support_artist2, :string, default: ""
    add_column :venue_shows, :support_artist3, :string, default: ""
    add_column :venue_shows, :support_artist4, :string, default: ""
    add_column :venue_shows, :support_artist5, :string, default: ""
    add_column :venue_shows, :support_artist6, :string, default: ""
    add_column :venue_shows, :support_artist7, :string, default: ""
  end
end
