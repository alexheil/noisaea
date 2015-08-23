class CreateRecordLabelMicroposts < ActiveRecord::Migration
  def change
    create_table(:record_label_microposts) do |t|
      t.references :record_label
      t.text :content

      t.timestamps
    end

    add_index :record_label_microposts, :record_label_id
  end
end
