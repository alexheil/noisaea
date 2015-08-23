class PostComment < ActiveRecord::Base
  belongs_to :post
  belongs_to :artist
  belongs_to :fan
  belongs_to :record_label
  belongs_to :venue
  belongs_to :producer
end
