class CreateRecordLabelRelationships < ActiveRecord::Migration
  def change
    create_table(:record_label_relationships) do |t|
      t.references :fan
      t.references :record_label


      t.timestamps
    end

    add_index :record_label_relationships, :fan_id
    add_index :record_label_relationships, :record_label_id
    add_index :record_label_relationships, [:fan_id, :record_label_id], unique: true
  end
end
