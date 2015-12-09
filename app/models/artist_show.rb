class ArtistShow < ActiveRecord::Base
  belongs_to :artist
  belongs_to :fan

  default_scope -> { order(:year, :month, :day) }

  validates :artist_id, presence: true
  validates :month, presence: true, length: { maximum: 2 }, numericality: { less_than_or_equal_to: 12, greater_than: 0}
  validates :day, presence: true, length: { maximum: 2 }, numericality: { less_than_or_equal_to: 31, greater_than: 0 }
  validates :year, presence: true, length: { is: 4 }, numericality: { less_than_or_equal_to: 2017, greater_than: 2014}
  validates :location, format: { with: /[A-Z][a-zA-Z]+,[ ][A-Z]/ }, allow_blank: true
  validates :description, length: { maximum: 14216 }, allow_blank: true
  validates :ticket_url, format: { with: /\A(http|https):\/\/|[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,6}(:[0-9]{1,5})?(\/.*)?\z/ix }, allow_blank: true
  validates :flyer_url, format: { with: /\A(http|https):\/\/|[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,6}(:[0-9]{1,5})?(\/.*)?\z/ix }, allow_blank: true

  before_save :smart_add_url_protocol
  before_save :correct_calender_time
  #before_save :ticketfly_affiliate_link

  private

    def correct_calender_time
      if self.month == 2 && self.year == 2016
        self.day <= 29
      elsif self.month == 2
        self.day <= 28
      elsif self.month == 4 || 6 || 9 || 11
        self.day <= 30
      end
    end

    #def ticketfly_affiliate_link
      #self.ticket_url = "#{self.ticket_url}" + "noisaea" if self.ticket_url[ /\A((http|https)?:\/\/)?(www.)?ticketfly.com\//i ]
    #end

    def smart_add_url_protocol
      unless self.ticket_url[/\Ahttp:\/\//] || self.ticket_url[/\Ahttps:\/\//]
        self.ticket_url = "https://#{self.ticket_url}" unless self.ticket_url == ""
      end
    end

end
