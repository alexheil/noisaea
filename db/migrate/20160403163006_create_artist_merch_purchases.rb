class CreateArtistMerchPurchases < ActiveRecord::Migration
  def change
    create_table(:artist_merch_purchases) do |t|
      t.references :artist
      t.references :fan
      t.references :artist_merch
      t.string :stripe_charge_id
      t.integer :quantity, default: 1
      t.integer :pay_your_own_price, default: 0
      t.integer :complete_price
      t.string :full_name, default: ""
      t.string :street_address, default: ""
      t.string :city, default: ""
      t.string :state, default: ""
      t.string :country, default: ""
      t.string :zip_code, default: ""
      t.boolean :is_shipped, default: false, null: false

      t.timestamps
    end

    add_index :artist_merch_purchases, :artist_id
    add_index :artist_merch_purchases, :fan_id
    add_index :artist_merch_purchases, :artist_merch_id
  end
end
