class ArtistMicropost < ActiveRecord::Base
  belongs_to :artist
  belongs_to :fan

  has_many :artist_micropost_comments, dependent: :destroy

  default_scope -> { order('id DESC') }

  validates :artist_id, presence: true
  validates :content, presence: true, length: { maximum: 14216 }

end
