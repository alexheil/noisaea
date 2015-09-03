class CreatePostCommentVotes < ActiveRecord::Migration
  def change
    create_table(:post_comment_votes) do |t|
      t.references :post_comment
      t.references :fan
      t.references :artist
      t.references :record_label
      t.references :venue
      t.references :producer


      t.timestamps
    end

    add_index :post_comment_votes, :post_comment_id, name: :index_post_comment_id_post_comment_votes
    add_index :post_comment_votes, :fan_id
    add_index :post_comment_votes, :artist_id
    add_index :post_comment_votes, :record_label_id
    add_index :post_comment_votes, :venue_id
    add_index :post_comment_votes, :producer_id
    add_index :post_comment_votes, [:fan_id, :post_comment_id], unique: true, name: :index_fan_id_post_comment_votes
    add_index :post_comment_votes, [:artist_id, :post_comment_id], unique: true, name: :index_artist_id_post_comment_votes
    add_index :post_comment_votes, [:record_label_id, :post_comment_id], unique: true, name: :index_record_label_id_post_comment_votes
    add_index :post_comment_votes, [:venue_id, :post_comment_id], unique: true, name: :index_venue_id_post_comment_votes
    add_index :post_comment_votes, [:producer_id, :post_comment_id], unique: true, name: :index_producer_id_post_comment_votes
  end
end
