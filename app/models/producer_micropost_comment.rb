class ProducerMicropostComment < ActiveRecord::Base
  belongs_to :producer_micropost
  belongs_to :artist
  belongs_to :fan
  belongs_to :record_label
  belongs_to :venue
  belongs_to :producer

  validates :producer_micropost_id, presence: true
  validates :content, presence: true, length: { maximum: 1832 }

end
