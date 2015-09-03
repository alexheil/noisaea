class PostCommentVote < ActiveRecord::Base
  belongs_to :post_comment
  belongs_to :artist
  belongs_to :fan
  belongs_to :record_label
  belongs_to :venue
  belongs_to :producer

  validates :post_comment_id, presence: true
end
