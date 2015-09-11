class FanProfile < ActiveRecord::Base
  belongs_to :fan

  validates :fan_id, presence: true
  validates :location, format: { with: /[A-Z][a-zA-Z]+,[ ]?[A-Z]{2}/ }, allow_blank: true

  before_save :smart_add_url_protocol

  protected

    def smart_add_url_protocol
      unless self.website[/\Ahttp:\/\//] || self.website[/\Ahttps:\/\//]
        self.website = "https://#{self.website}" unless website == ""
      end
    end

end
