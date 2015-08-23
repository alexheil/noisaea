class CreateDeveloperComments < ActiveRecord::Migration
  def change
    create_table(:developer_comments) do |t|
      t.references :developer
      t.references :artist
      t.references :fan
      t.references :record_label
      t.references :venue
      t.references :producer

      t.text :content

      t.timestamps
    end

    add_index :developer_comments, :developer_id
    add_index :developer_comments, :artist_id
    add_index :developer_comments, :fan_id
    add_index :developer_comments, :record_label_id
    add_index :developer_comments, :venue_id
    add_index :developer_comments, :producer_id
  end
end
