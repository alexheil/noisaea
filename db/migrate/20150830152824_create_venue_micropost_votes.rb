class CreateVenueMicropostVotes < ActiveRecord::Migration
  def change
    create_table(:venue_micropost_votes) do |t|
      t.references :venue_micropost
      t.references :fan
      t.references :artist
      t.references :record_label
      t.references :venue
      t.references :producer


      t.timestamps
    end

    add_index :venue_micropost_votes, :venue_micropost_id
    add_index :venue_micropost_votes, :fan_id
    add_index :venue_micropost_votes, :artist_id
    add_index :venue_micropost_votes, :record_label_id
    add_index :venue_micropost_votes, :venue_id
    add_index :venue_micropost_votes, :producer_id
    add_index :venue_micropost_votes, [:fan_id, :venue_micropost_id], unique: true, name: :index_fan_id_v_micropost_votes
    add_index :venue_micropost_votes, [:artist_id, :venue_micropost_id], unique: true, name: :index_artist_id_v_micropost_votes
    add_index :venue_micropost_votes, [:record_label_id, :venue_micropost_id], unique: true, name: :index_record_label_id_v_micropost_votes
    add_index :venue_micropost_votes, [:venue_id, :venue_micropost_id], unique: true, name: :index_venue_id_v_micropost_votes
    add_index :venue_micropost_votes, [:producer_id, :venue_micropost_id], unique: true, name: :index_producer_id_v_micropost_votes
  end
end
