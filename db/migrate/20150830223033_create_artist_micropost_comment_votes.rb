class CreateArtistMicropostCommentVotes < ActiveRecord::Migration
  def change
    create_table(:artist_micropost_comment_votes) do |t|
      t.references :artist_micropost_comment
      t.references :fan
      t.references :artist
      t.references :record_label
      t.references :venue
      t.references :producer


      t.timestamps
    end

    add_index :artist_micropost_comment_votes, :artist_micropost_comment_id, name: :index_a_comment_id_a_comment_votes
    add_index :artist_micropost_comment_votes, :fan_id
    add_index :artist_micropost_comment_votes, :artist_id
    add_index :artist_micropost_comment_votes, :record_label_id
    add_index :artist_micropost_comment_votes, :venue_id
    add_index :artist_micropost_comment_votes, :producer_id
    add_index :artist_micropost_comment_votes, [:fan_id, :artist_micropost_comment_id], unique: true, name: :index_fan_id_a_comment_votes
    add_index :artist_micropost_comment_votes, [:artist_id, :artist_micropost_comment_id], unique: true, name: :index_artist_id_a_comment_votes
    add_index :artist_micropost_comment_votes, [:record_label_id, :artist_micropost_comment_id], unique: true, name: :index_record_label_id_a_comment_votes
    add_index :artist_micropost_comment_votes, [:venue_id, :artist_micropost_comment_id], unique: true, name: :index_venue_id_a_comment_votes
    add_index :artist_micropost_comment_votes, [:producer_id, :artist_micropost_comment_id], unique: true, name: :index_producer_id_a_comment_votes
  end
end
