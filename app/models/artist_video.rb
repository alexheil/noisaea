class ArtistVideo < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :artist
  belongs_to :fan

  default_scope -> { order('id DESC') }

  validates :artist_id, presence: true
  validates :title, presence: true
  validates :youtube_url, presence: true, format: { with: /\A((http|https)?:\/\/)?(www.)?youtube.com\//i }
  validates :description, length: { maximum: 14216 }, allow_blank: true

  before_save :should_generate_new_friendly_id?, if: :title_changed?

  private

    def should_generate_new_friendly_id?
      title_changed?
    end

end
