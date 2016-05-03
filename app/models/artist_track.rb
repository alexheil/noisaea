class ArtistTrack < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  default_scope -> { order('number') }

  belongs_to :artist
  belongs_to :artist_album

  validates :artist_id, presence: true
  validates :artist_album_id, presence: true
  validates :title, :uniqueness => {:scope => :artist_album_id}, presence: true, length: { maximum: 150 }
  validates :number, :uniqueness => {:scope => :artist_album_id}, presence: true, length: { maximum: 2 }, numericality: { less_than_or_equal_to: 99, greater_than: 0}
  validates :price, presence: true, length: { maximum: 6 }, numericality: { greater_than: -1}
  validates :currency, presence: true
  validates :lyrics, length: { maximum: 14216 }, allow_blank: true

  before_save :should_generate_new_friendly_id?, if: :title_changed?

  private

    def should_generate_new_friendly_id?
      title_changed?
    end

    def slug_candidates
      [:title, [:number, :title], [:number, :title, :artist_album_id]]
    end

end
