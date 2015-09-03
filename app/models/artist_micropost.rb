class ArtistMicropost < ActiveRecord::Base
  belongs_to :artist
  belongs_to :fan
  #belongs_to :record_label
  #belongs_to :venue
  #belongs_to :producer

  has_many :artist_micropost_comments, dependent: :destroy

  has_many :artist_micropost_votes
  #has_many :artists, through: :artist_micropost_votes
  #has_many :fans, through: :artist_micropost_votes
  #has_many :record_labels, through: :artist_micropost_votes
  #has_many :venues, through: :artist_micropost_votes
  #has_many :producers, through: :artist_micropost_votes

  default_scope -> { order('id DESC') }

  validates :artist_id, presence: true
  validates :content, presence: true, length: { maximum: 14216 }

end
