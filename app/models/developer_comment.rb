class DeveloperComment < ActiveRecord::Base
  belongs_to :developer
  belongs_to :artist
  belongs_to :fan
  belongs_to :record_label
  belongs_to :venue
  belongs_to :producer

  has_many :developer_comment_votes

  validates :developer_id, presence: true
  validates :content, presence: true, length: { maximum: 1832 }
end
