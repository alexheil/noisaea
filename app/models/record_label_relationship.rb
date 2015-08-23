class RecordLabelRelationship < ActiveRecord::Base
  belongs_to :record_label
  belongs_to :fan

  validates :record_label_id, presence: true
  validates :fan_id, presence: true
end
