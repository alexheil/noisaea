class RecordLabelMicropostCommentVote < ActiveRecord::Base
  belongs_to :record_label_micropost_comment
  belongs_to :artist
  belongs_to :fan
  belongs_to :record_label
  belongs_to :venue
  belongs_to :producer

  validates :record_label_micropost_comment_id, presence: true
end
