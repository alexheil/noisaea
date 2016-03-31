class CreateArtistPaymentSettings < ActiveRecord::Migration
  def change
    create_table :artist_payment_settings do |t|
      t.references :artist
      t.string :stripe_publishable_key
      t.string :stripe_secret_key
      t.string :stripe_id
      t.string :first_name
      t.string :last_name
      t.string :currency
      t.string :country
      t.integer :month
      t.integer :day
      t.integer :year

      t.timestamps null: false
    end

    add_index :artist_payment_settings, :artist_id
    add_index :artist_payment_settings, :stripe_publishable_key
    add_index :artist_payment_settings, :stripe_secret_key
    add_index :artist_payment_settings, :stripe_id
  end
end
