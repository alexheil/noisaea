class ProducerRelationship < ActiveRecord::Base
  belongs_to :producer
  belongs_to :fan

  validates :producer_id, presence: true
  validates :fan_id, presence: true
end
