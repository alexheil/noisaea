class CreateArtistMicroposts < ActiveRecord::Migration
  def change
    create_table(:artist_microposts) do |t|
      t.references :artist
      t.text :content

      t.timestamps
    end

    add_index :artist_microposts, :artist_id
  end
end
