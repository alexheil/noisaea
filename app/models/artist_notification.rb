class ArtistNotification < ActiveRecord::Base

  default_scope -> { order('id DESC') }

  belongs_to :artist_relationship
  belongs_to :artist_micropost
  belongs_to :artist_micropost_comment
  belongs_to :artist_micropost_vote
  belongs_to :artist
  belongs_to :fan
  belongs_to :record_label
  belongs_to :venue
  belongs_to :producer

  validates :notice_type, presence: true

  def cleanup
    ArtistNotification.where(read: true).where("updated_at > ?", 3.days.ago).find_each do |notification|
      notification.destroy
    end
  end

end
