class CreateVenueMicropostComments < ActiveRecord::Migration
  def change
    create_table(:venue_micropost_comments) do |t|
      t.references :venue_micropost
      t.references :artist
      t.references :fan
      t.references :record_label
      t.references :venue
      t.references :producer

      t.text :content

      t.timestamps
    end

    add_index :venue_micropost_comments, :venue_micropost_id
    add_index :venue_micropost_comments, :artist_id
    add_index :venue_micropost_comments, :fan_id
    add_index :venue_micropost_comments, :record_label_id
    add_index :venue_micropost_comments, :venue_id
    add_index :venue_micropost_comments, :producer_id
  end
end
