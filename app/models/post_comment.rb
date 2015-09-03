class PostComment < ActiveRecord::Base
  belongs_to :post
  belongs_to :artist
  belongs_to :fan
  belongs_to :record_label
  belongs_to :venue
  belongs_to :producer

  has_many :post_comment_votes

  validates :post_id, presence: true
  validates :content, presence: true, length: { maximum: 1832 }
end
