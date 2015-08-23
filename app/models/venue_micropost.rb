class VenueMicropost < ActiveRecord::Base
  belongs_to :venue
  belongs_to :fan

  has_many :venue_micropost_comments, dependent: :destroy

  default_scope -> { order('id DESC') }

  validates :venue_id, presence: true
  validates :content, presence: true, length: { maximum: 14216 }

end
