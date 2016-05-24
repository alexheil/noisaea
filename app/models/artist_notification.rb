class ArtistNotification < ActiveRecord::Base

  default_scope -> { order('id DESC') }

  belongs_to :artist_relationship
  belongs_to :artist_micropost
  belongs_to :artist_micropost_comment
  belongs_to :artist_micropost_vote
  belongs_to :notifier_artist, class_name: 'Artist'
  belongs_to :notifier_fan, class_name: 'Fan'
  belongs_to :notifier_record_label, class_name: 'RecordLabel'
  belongs_to :notifier_venue, class_name: 'Venue'
  belongs_to :notifier_producer, class_name: 'Producer'

  validates :notice_type, presence: true

  def self.notification_cleanup
    ArtistNotification.where(read: true).find_each do |notification|
      notification.destroy unless notification.updated_at > 3.days.ago
    end
  end

  def self.delete_bad_notifications
    ArtistNotification.where(notice_type: 'comment').find_each do |notification|
      notification.destroy unless notification.created_at < 3.days.ago
    end
  end

end
