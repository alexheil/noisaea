class ProducerMicropost < ActiveRecord::Base
  belongs_to :producer
  belongs_to :fan

  has_many :producer_micropost_comments, dependent: :destroy

  default_scope -> { order('id DESC') }

  validates :producer_id, presence: true
  validates :content, presence: true, length: { maximum: 14216 }

end
