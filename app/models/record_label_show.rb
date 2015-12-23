class RecordLabelShow < ActiveRecord::Base
  belongs_to :record_label
  belongs_to :fan

  default_scope -> { order(:year, :month, :day) }

  validates :record_label_id, presence: true
  validates :month, presence: true, length: { maximum: 2 }, numericality: { less_than_or_equal_to: 12, greater_than: 0}
  validates :day, presence: true, length: { maximum: 2 }, numericality: { less_than_or_equal_to: 31, greater_than: 0 }
  validates :year, presence: true, length: { is: 4 }, numericality: { less_than_or_equal_to: 2017, greater_than: 2014}
  validates :venue, presence: true, length: { maximum: 120 }
  validates :location, presence: true, format: { with: /[A-Z][a-zA-Z]+,[ ][A-Z]/ }
  validates :description, length: { maximum: 14216 }, allow_blank: true
  validates :ticket_url, format: { with: /\A(http|https):\/\/|[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,6}(:[0-9]{1,5})?(\/.*)?\z/ix }, allow_blank: true
  validates :flyer_url, format: { with: /\A(http|https):\/\/|[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,6}(:[0-9]{1,5})?(\/.*)?\z/ix }, allow_blank: true

  before_save :smart_add_url_protocol
  before_save :february_time
  before_save :smart_calender
  #before_save :ticketfly_affiliate_link

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

    #def ticketfly_affiliate_link
      #self.ticket_url = "#{self.ticket_url}" + "noisaea" if self.ticket_url[ /\A((http|https)?:\/\/)?(www.)?ticketfly.com\//i ]
    #end

    def smart_add_url_protocol
      unless self.ticket_url[/\Ahttp:\/\//] || self.ticket_url[/\Ahttps:\/\//]
        self.ticket_url = "https://#{self.ticket_url}" unless self.ticket_url == ""
      end
    end

end
