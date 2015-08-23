class CreateArtistRelationships < ActiveRecord::Migration
  def change
    create_table(:artist_relationships) do |t|
      t.references :fan
      t.references :artist


      t.timestamps
    end

    add_index :artist_relationships, :fan_id
    add_index :artist_relationships, :artist_id
    add_index :artist_relationships, [:fan_id, :artist_id], unique: true
  end
end
