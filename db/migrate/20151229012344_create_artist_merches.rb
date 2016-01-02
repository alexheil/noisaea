class CreateArtistMerches < ActiveRecord::Migration
  def change
    create_table(:artist_merches) do |t|
      t.references :artist
      t.string :title
      t.text :description
      t.string :category
      t.integer :base_price
      t.integer :shipping_price
      t.integer :total_price
      t.string :currency
      t.integer :quantity
      t.string :merch_url
      t.string :image_url
      t.string :slug

      t.timestamps
    end

    add_index :artist_merches, :artist_id
  end
end
