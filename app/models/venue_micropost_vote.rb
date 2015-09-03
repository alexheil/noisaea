class VenueMicropostVote < ActiveRecord::Base
  belongs_to :venue_micropost
  belongs_to :artist
  belongs_to :fan
  belongs_to :record_label
  belongs_to :venue
  belongs_to :producer

  validates :venue_micropost_id, presence: true
end
