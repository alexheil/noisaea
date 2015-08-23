class VenueRelationship < ActiveRecord::Base
  belongs_to :venue
  belongs_to :fan

  validates :venue_id, presence: true
  validates :fan_id, presence: true
end
