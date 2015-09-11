class VenueProfile < ActiveRecord::Base
  belongs_to :venue

  validates :venue_id, presence: true
  validates :biography, length: { maximum: 14216 }, allow_blank: true
  validates :location, format: { with: /[A-Z][a-zA-Z]+,[ ]?[A-Z]{2}/ }, allow_blank: true
  validates :founded, length: { is: 4 }, numericality: { less_than_or_equal_to: 2016, greater_than: 1900}, allow_blank: true
  validates :facebook_url, format: { with: /\A((http|https)?:\/\/)?(www.)?facebook.com\//i  }, allow_blank: true
  validates :twitter_url, format: { with: /\A((http|https)?:\/\/)?(www.)?twitter.com\//i }, allow_blank: true
  validates :youtube_url, format: { with: /\A((http|https)?:\/\/)?(www.)?youtube.com\//i }, allow_blank: true
  validates :ticketfly_url, format: { with: /\A((http|https)?:\/\/)?(www.)?ticketfly.com\//i }, allow_blank: true


  before_save :smart_add_url_protocol
  before_save :downcase_url

  protected

    def smart_add_url_protocol
      unless self.facebook_url[/\Ahttp:\/\//] || self.facebook_url[/\Ahttps:\/\//]
        self.facebook_url = "https://#{self.facebook_url}" unless facebook_url == ""
      end
      unless self.twitter_url[/\Ahttp:\/\//] || self.twitter_url[/\Ahttps:\/\//]
        self.twitter_url = "https://#{self.twitter_url}" unless twitter_url == ""
      end
      unless self.youtube_url[/\Ahttp:\/\//] || self.youtube_url[/\Ahttps:\/\//]
        self.youtube_url = "https://#{self.youtube_url}" unless youtube_url == ""
      end
      unless self.ticketfly_url[/\Ahttp:\/\//] || self.ticketfly_url[/\Ahttps:\/\//]
        self.ticketfly_url = "https://#{self.ticketfly_url}" unless ticketfly_url == ""
      end
      unless self.website[/\Ahttp:\/\//] || self.website[/\Ahttps:\/\//]
        self.website = "https://#{self.website}" unless website == ""
      end
    end

    def downcase_url
      self.facebook_url = facebook_url.downcase
      self.twitter_url = twitter_url.downcase
      self.youtube_url = youtube_url.downcase
      self.ticketfly_url = ticketfly_url.downcase
      self.website = website.downcase
    end

end
