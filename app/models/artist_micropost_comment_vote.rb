class ArtistMicropostCommentVote < ActiveRecord::Base
  belongs_to :artist_micropost_comment
  belongs_to :artist
  belongs_to :fan
  belongs_to :record_label
  belongs_to :venue
  belongs_to :producer

  validates :artist_micropost_comment_id, presence: true
end
