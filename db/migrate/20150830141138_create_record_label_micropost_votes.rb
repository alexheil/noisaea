class CreateRecordLabelMicropostVotes < ActiveRecord::Migration
  def change
    create_table(:record_label_micropost_votes) do |t|
      t.references :record_label_micropost
      t.references :fan
      t.references :artist
      t.references :record_label
      t.references :venue
      t.references :producer


      t.timestamps
    end

    add_index :record_label_micropost_votes, :record_label_micropost_id, name: :index_record_label_micropost_id_rl_micropost_votes
    add_index :record_label_micropost_votes, :fan_id
    add_index :record_label_micropost_votes, :artist_id
    add_index :record_label_micropost_votes, :record_label_id
    add_index :record_label_micropost_votes, :venue_id
    add_index :record_label_micropost_votes, :producer_id
    add_index :record_label_micropost_votes, [:fan_id, :record_label_micropost_id], unique: true, name: :index_fan_id_rl_micropost_votes
    add_index :record_label_micropost_votes, [:artist_id, :record_label_micropost_id], unique: true, name: :index_artist_id_rl_micropost_votes
    add_index :record_label_micropost_votes, [:record_label_id, :record_label_micropost_id], unique: true, name: :index_record_label_id_rl_micropost_votes
    add_index :record_label_micropost_votes, [:venue_id, :record_label_micropost_id], unique: true, name: :index_venue_id_rl_micropost_votes
    add_index :record_label_micropost_votes, [:producer_id, :record_label_micropost_id], unique: true, name: :index_producer_id_rl_micropost_votes
  end
end
