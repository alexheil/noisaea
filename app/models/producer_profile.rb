class ProducerProfile < ActiveRecord::Base
  belongs_to :producer

  has_attached_file :cover_img, styles: { perfect: "1920x640#", small: "800x266#" }
  has_attached_file :profile_img, styles: { perfect: "150x150#" }

  validates_attachment_content_type :cover_img, content_type: /\Aimage\/.*\Z/
  validates_attachment_content_type :profile_img, content_type: /\Aimage\/.*\Z/

  validates :producer_id, presence: true
  validates :biography, length: { maximum: 14216 }, allow_blank: true
  validates :location, format: { with: /[A-Z][a-zA-Z]+,[ ]?[A-Z]/ }, allow_blank: true
  validates :founded, length: { is: 4 }, numericality: { less_than_or_equal_to: 2016, greater_than: 1900}, allow_blank: true
  validates :facebook_url, format: { with: /\A((http|https)?:\/\/)?(www.)?facebook.com\/?/i  }, allow_blank: true
  validates :twitter_url, format: { with: /\A((http|https)?:\/\/)?(www.)?twitter.com\/?/i }, allow_blank: true
  validates :youtube_url, format: { with: /\A((http|https)?:\/\/)?(www.)?youtube.com\/?/i }, allow_blank: true
  validates :website, format: { with: /\A((http|https)?:\/\/)?(www.)?[a-zA-Z0-9]+.[a-z]+\/?/i }, allow_blank: true
  validates :letlyrics_url, format: { with: /\A((http|https)?:\/\/)?(www.)?letlyrics.com\/?/i }, allow_blank: true
  validates :theme_color, format: { with: /(#)?[a-f0-9]{6}/i }, allow_blank: true

  before_save :smart_add_url_protocol
  before_save :downcase_url
  before_save :add_pound_to_hex

  protected

    def add_pound_to_hex
      unless self.theme_color.starts_with?('#')
        self.theme_color = "##{self.theme_color}" unless theme_color.blank?
      end
    end

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
      unless self.website[/\Ahttp:\/\//] || self.website[/\Ahttps:\/\//]
        self.website = "https://#{self.website}" unless website.blank?
      end
      unless self.letlyrics_url[/\Ahttp:\/\//] || self.letlyrics_url[/\Ahttps:\/\//]
        self.letlyrics_url = "https://#{self.letlyrics_url}" unless letlyrics_url.blank?
      end
    end

    def downcase_url
      self.facebook_url = facebook_url.downcase
      self.twitter_url = twitter_url.downcase
      self.youtube_url = youtube_url.downcase
      self.website = website.downcase
      self.letlyrics_url = letlyrics_url.downcase
    end

end
