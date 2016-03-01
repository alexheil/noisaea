class ArtistProfile < ActiveRecord::Base
  belongs_to :artist

  has_attached_file :cover_img, styles: { perfect: "1920x640#", small: "800x266#" }
  has_attached_file :profile_img, styles: { perfect: "150x150#" }

  validates_attachment_content_type :cover_img, content_type: /\Aimage\/.*\Z/
  validates_attachment_content_type :profile_img, content_type: /\Aimage\/.*\Z/

  validates :artist_id, presence: true
  validates :location, format: { with: /[A-Z][a-zA-Z]+,[ ][A-Z]/ }, allow_blank: true
  validates :biography, length: { maximum: 14216 }, allow_blank: true
  validates :facebook_url, format: { with: /\A((http|https)?:\/\/)?(www.)?facebook.com\/?/i  }, allow_blank: true
  validates :twitter_url, format: { with: /\A((http|https)?:\/\/)?(www.)?twitter.com\/?/i }, allow_blank: true
  validates :youtube_url, format: { with: /\A((http|https)?:\/\/)?(www.)?youtube.com\/?/i }, allow_blank: true
  validates :itunes_url, format: { with: /\A((http|https)?:\/\/)?(www.)?itunes.apple.com\/?/i }, allow_blank: true
  validates :amazon_url, format: { with: /\A((http|https)?:\/\/)?(www.)?amazon.com\/?/i }, allow_blank: true
  validates :google_play_url, format: { with: /\A((http|https)?:\/\/)?(play.)google.com\/?/i }, allow_blank: true
  validates :ticketfly_url, format: { with: /\A((http|https)?:\/\/)?(www.)?ticketfly.com\/?/i }, allow_blank: true
  validates :website, format: { with: /\A((http|https)?:\/\/)?(www.)?[a-zA-Z0-9]+.[a-z]+\/?/i }, allow_blank: true
  validates :letlyrics_url, format: { with: /\A((http|https)?:\/\/)?(www.)?letlyrics.com\/?/i }, allow_blank: true
  validates :theme_color, format: { with: /(#)?[a-f0-9]{6}/i }, allow_blank: true

  before_save :smart_add_url_protocol
  before_save :downcase_url
  before_save :add_pound_to_hex
  before_save :blank_genre

  protected

    def smart_add_url_protocol
      unless self.facebook_url[/\Ahttp:\/\//] || self.facebook_url[/\Ahttps:\/\//]
        self.facebook_url = "https://#{self.facebook_url}" unless facebook_url.blank?
      end
      unless self.twitter_url[/\Ahttp:\/\//] || self.twitter_url[/\Ahttps:\/\//]
        self.twitter_url = "https://#{self.twitter_url}" unless twitter_url.blank?
      end
      unless self.youtube_url[/\Ahttp:\/\//] || self.youtube_url[/\Ahttps:\/\//]
        self.youtube_url = "https://#{self.youtube_url}" unless youtube_url.blank?
      end
      unless self.itunes_url[/\Ahttp:\/\//] || self.itunes_url[/\Ahttps:\/\//]
        self.itunes_url = "https://#{self.itunes_url}" unless itunes_url.blank?
      end
      unless self.amazon_url[/\Ahttp:\/\//] || self.amazon_url[/\Ahttps:\/\//]
        self.amazon_url = "https://#{self.amazon_url}" unless amazon_url.blank?
      end
      unless self.google_play_url[/\Ahttp:\/\//] || self.google_play_url[/\Ahttps:\/\//]
        self.google_play_url = "https://#{self.google_play_url}" unless google_play_url.blank?
      end
      unless self.ticketfly_url[/\Ahttp:\/\//] || self.ticketfly_url[/\Ahttps:\/\//]
        self.ticketfly_url = "https://#{self.ticketfly_url}" unless ticketfly_url.blank?
      end
      unless self.website[/\Ahttp:\/\//] || self.website[/\Ahttps:\/\//]
        self.website = "https://#{self.website}" unless website.blank?
      end
      unless self.letlyrics_url[/\Ahttp:\/\//] || self.letlyrics_url[/\Ahttps:\/\//]
        self.letlyrics_url = "https://#{self.letlyrics_url}" unless letlyrics_url.blank?
      end
    end

    def add_pound_to_hex
      unless self.theme_color.starts_with?('#')
        self.theme_color = "##{self.theme_color}" unless theme_color.blank?
      end
    end

    def blank_genre
      if self.genre == "select genre"
        self.genre = ""
      end
    end

    def downcase_url
      self.facebook_url = facebook_url.downcase
      self.twitter_url = twitter_url.downcase
      self.youtube_url = youtube_url.downcase
      self.itunes_url = itunes_url.downcase
      self.google_play_url = google_play_url.downcase
      self.amazon_url = amazon_url.downcase
      self.website = website.downcase
      self.letlyrics_url = letlyrics_url.downcase
    end

end
