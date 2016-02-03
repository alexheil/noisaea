class ArtistAlbum < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  default_scope -> { order('year DESC', 'month DESC', 'day DESC') }

  belongs_to :artist
  belongs_to :fan

  validates :artist_id, presence: true
  validates :title, presence: true
  validates :description, length: { maximum: 14216 }, allow_blank: true
  validates :price, presence: true, length: { maximum: 6 }, numericality: { greater_than: -1}
  validates :currency, presence: true
  validates :month, presence: true, length: { maximum: 2 }, numericality: { less_than_or_equal_to: 12, greater_than: 0}
  validates :day, presence: true, length: { maximum: 2 }, numericality: { less_than_or_equal_to: 31, greater_than: 0 }
  validates :year, presence: true, length: { is: 4 }, numericality: { less_than_or_equal_to: 2017, greater_than: 1950}
  validates :album_url, format: { with: /\A((http|https)?:\/\/)?(www.)?[a-zA-Z0-9]+.[a-z]+\/?/i }
  validates :cover_art_url, format: { with: /\A((http|https)?:\/\/)?(www.)?[a-zA-Z0-9]+.[a-z]+\/?/i }

  before_save :smart_add_url_protocol
  before_save :february_time
  before_save :smart_calender

  private

    def february_time
      if self.month == 2 && self.year == 2016
        self.day <= 29
      elsif self.month == 2
        self.day <= 28
      end
    end

    def smart_calender
      if self.month == 4
        self.day <= 30
      elsif self.month == 6
        self.day <= 30
      elsif self.month == 9
        self.day <= 30
      elsif self.month == 11
        self.day <= 30
      end
    end

    def smart_add_url_protocol
      unless self.album_url[/\Ahttp:\/\//] || self.album_url[/\Ahttps:\/\//]
        self.album_url = "https://#{self.album_url}" unless self.album_url == ""
      end
      unless self.cover_art_url[/\Ahttp:\/\//] || self.cover_art_url[/\Ahttps:\/\//]
        self.cover_art_url = "https://#{self.cover_art_url}" unless self.cover_art_url == ""
      end
    end

end
