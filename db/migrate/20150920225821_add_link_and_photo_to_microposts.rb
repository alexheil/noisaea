class AddLinkAndPhotoToMicroposts < ActiveRecord::Migration
  def change
    add_column :artist_microposts, :link_url, :string, default: ""
    add_column :artist_microposts, :photo_url, :string, default: ""
    add_column :record_label_microposts, :link_url, :string, default: ""
    add_column :record_label_microposts, :photo_url, :string, default: ""
    add_column :venue_microposts, :link_url, :string, default: ""
    add_column :venue_microposts, :photo_url, :string, default: ""
    add_column :producer_microposts, :link_url, :string, default: ""
    add_column :producer_microposts, :photo_url, :string, default: ""
  end
end
