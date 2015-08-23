class CreateVenueRelationships < ActiveRecord::Migration
  def change
    create_table(:venue_relationships) do |t|
      t.references :fan
      t.references :venue


      t.timestamps
    end

    add_index :venue_relationships, :fan_id
    add_index :venue_relationships, :venue_id
    add_index :venue_relationships, [:fan_id, :venue_id], unique: true
  end
end
