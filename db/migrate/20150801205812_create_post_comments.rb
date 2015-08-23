class CreatePostComments < ActiveRecord::Migration
  def change
    create_table(:post_comments) do |t|
      t.references :post
      t.references :artist
      t.references :fan
      t.references :record_label
      t.references :venue
      t.references :producer

      t.text :content

      t.timestamps
    end

    add_index :post_comments, :post_id
    add_index :post_comments, :artist_id
    add_index :post_comments, :fan_id
    add_index :post_comments, :record_label_id
    add_index :post_comments, :venue_id
    add_index :post_comments, :producer_id
  end
end
