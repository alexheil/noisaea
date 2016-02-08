class ArtistMicropostComment < ActiveRecord::Base
  belongs_to :artist_micropost
  belongs_to :artist
  belongs_to :fan
  belongs_to :record_label
  belongs_to :venue
  belongs_to :producer

  has_many :artist_notifications, dependent: :destroy
  has_many :artist_micropost_comment_votes, dependent: :destroy

  validates :artist_micropost_id, presence: true
  validates :content, presence: true, length: { maximum: 1832 }
end
