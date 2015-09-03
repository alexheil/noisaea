class CreateDeveloperCommentVotes < ActiveRecord::Migration
  def change
    create_table(:developer_comment_votes) do |t|
      t.references :developer_comment
      t.references :fan
      t.references :artist
      t.references :record_label
      t.references :venue
      t.references :producer


      t.timestamps
    end

    add_index :developer_comment_votes, :developer_comment_id, name: :index_dev_comment_id_dev_comment_votes
    add_index :developer_comment_votes, :fan_id
    add_index :developer_comment_votes, :artist_id
    add_index :developer_comment_votes, :record_label_id
    add_index :developer_comment_votes, :venue_id
    add_index :developer_comment_votes, :producer_id
    add_index :developer_comment_votes, [:fan_id, :developer_comment_id], unique: true, name: :index_fan_id_dev_comment_votes
    add_index :developer_comment_votes, [:artist_id, :developer_comment_id], unique: true, name: :index_artist_id_dev_comment_votes
    add_index :developer_comment_votes, [:record_label_id, :developer_comment_id], unique: true, name: :index_record_label_id_dev_comment_votes
    add_index :developer_comment_votes, [:venue_id, :developer_comment_id], unique: true, name: :index_venue_id_dev_comment_votes
    add_index :developer_comment_votes, [:producer_id, :developer_comment_id], unique: true, name: :index_producer_id_dev_comment_votes
  end
end
