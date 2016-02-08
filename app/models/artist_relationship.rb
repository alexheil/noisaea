class ArtistRelationship < ActiveRecord::Base
  belongs_to :artist
  belongs_to :fan

  has_many :artist_notifications, dependent: :destroy

  validates :artist_id, presence: true
  validates :fan_id, presence: true
end
