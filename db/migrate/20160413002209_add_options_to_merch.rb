class AddOptionsToMerch < ActiveRecord::Migration
  def change
    add_column :artist_merches, :options, :string

    add_column :artist_merch_purchases, :options, :string

    add_column :venue_profiles, :address, :string, default: ""
  end
end
