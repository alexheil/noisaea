class CreateArtistNotifications < ActiveRecord::Migration
  def change
    create_table(:artist_notifications) do |t|
      t.references :artist
      t.references :artist_relationship
      t.references :artist_micropost
      t.references :artist_micropost_comment
      t.references :artist_micropost_vote
      t.references :notifier_artist
      t.references :notifier_fan
      t.references :notifier_record_label
      t.references :notifier_venue
      t.references :notifier_producer
      t.string :notice_type
      t.boolean :read, default: false

      t.timestamps
    end

    add_foreign_key :artist_notifications, :artists
    add_foreign_key :artist_notifications, :artists, column: :notifier_artist_id
    add_foreign_key :artist_notifications, :fans, column: :notifier_fan_id
    add_foreign_key :artist_notifications, :record_labels, column: :notifier_record_label_id
    add_foreign_key :artist_notifications, :venues, column: :notifier_venue_id
    add_foreign_key :artist_notifications, :producers, column: :notifier_producer_id

    add_index :artist_notifications, :artist_id
    add_index :artist_notifications, :artist_relationship_id
    add_index :artist_notifications, :artist_micropost_id
    add_index :artist_notifications, :artist_micropost_comment_id
    add_index :artist_notifications, :artist_micropost_vote_id
    add_index :artist_notifications, :notifier_artist_id
    add_index :artist_notifications, :notifier_fan_id
    add_index :artist_notifications, :notifier_record_label_id
    add_index :artist_notifications, :notifier_venue_id
    add_index :artist_notifications, :notifier_producer_id
  end
end
