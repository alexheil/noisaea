class RecordLabelMicropost < ActiveRecord::Base
  belongs_to :record_label
  belongs_to :fan

  has_many :record_label_micropost_comments, dependent: :destroy

  default_scope -> { order('id DESC') }

  has_many :record_label_micropost_votes

  validates :record_label_id, presence: true
  validates :content, presence: true, length: { maximum: 14216 }

end
