class ArtistMicropostVote < ActiveRecord::Base
  belongs_to :artist_micropost
  belongs_to :artist
  belongs_to :fan
  belongs_to :record_label
  belongs_to :venue
  belongs_to :producer

  validates :artist_micropost_id, presence: true
end
