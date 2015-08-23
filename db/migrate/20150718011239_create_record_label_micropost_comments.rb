class CreateRecordLabelMicropostComments < ActiveRecord::Migration
  def change
    create_table(:record_label_micropost_comments) do |t|
      t.references :record_label_micropost
      t.references :artist
      t.references :fan
      t.references :record_label
      t.references :venue
      t.references :producer

      t.text :content

      t.timestamps
    end

    add_index :record_label_micropost_comments, :record_label_micropost_id, name: :index_record_label_micropost_id_for_comments
    add_index :record_label_micropost_comments, :artist_id
    add_index :record_label_micropost_comments, :fan_id
    add_index :record_label_micropost_comments, :record_label_id
    add_index :record_label_micropost_comments, :venue_id
    add_index :record_label_micropost_comments, :producer_id
  end
end
