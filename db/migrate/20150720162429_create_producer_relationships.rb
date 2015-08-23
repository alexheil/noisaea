class CreateProducerRelationships < ActiveRecord::Migration
  def change
    create_table(:producer_relationships) do |t|
      t.references :fan
      t.references :producer


      t.timestamps
    end

    add_index :producer_relationships, :fan_id
    add_index :producer_relationships, :producer_id
    add_index :producer_relationships, [:fan_id, :producer_id], unique: true
  end
end
