class FanProfile < ActiveRecord::Base
  belongs_to :fan

  has_attached_file :cover_img, styles: { perfect: "1920x640#", small: "800x266#" }
  has_attached_file :profile_img, styles: { perfect: "382x382#" }

  validates_attachment_content_type :cover_img, content_type: /\Aimage\/.*\Z/
  validates_attachment_content_type :profile_img, content_type: /\Aimage\/.*\Z/

  validates :fan_id, presence: true
  validates :location, format: { with: /[A-Z][a-zA-Z]+,[ ]?[A-Z]/ }, allow_blank: true
  validates :website, format: { with: /\A((http|https)?:\/\/)?(www.)?[a-zA-Z0-9]+.[a-z]+\/?/i }, allow_blank: true
  validates :theme_color, format: { with: /(#)?[a-f0-9]{6}/i }, allow_blank: true

  before_save :smart_add_url_protocol
  before_save :add_pound_to_hex

  protected

    def smart_add_url_protocol
      unless self.website[/\Ahttp:\/\//] || self.website[/\Ahttps:\/\//]
        self.website = "https://#{self.website}" unless website.blank?
      end
    end

    def add_pound_to_hex
      unless self.theme_color.starts_with?('#')
        self.theme_color = "##{self.theme_color}" unless theme_color.blank?
      end
    end

end
