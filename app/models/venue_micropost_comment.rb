class VenueMicropostComment < ActiveRecord::Base
  belongs_to :record_label_micropost
  belongs_to :artist
  belongs_to :fan
  belongs_to :record_label
  belongs_to :venue
  belongs_to :producer

  has_many :venue_micropost_comment_votes, dependent: :destroy

  validates :venue_micropost_id, presence: true
  validates :content, presence: true, length: { maximum: 1832 }

end
