class ProducerMicropost < ActiveRecord::Base
  belongs_to :producer
  belongs_to :fan

  has_many :producer_micropost_comments, dependent: :destroy

  default_scope -> { order('id DESC') }

  has_many :producer_micropost_votes

  validates :producer_id, presence: true
  validates :content, presence: true, length: { maximum: 14216 }
  validates :link_url, format: { with: /\A((http|https)?:\/\/)?(www.)?[a-zA-Z0-9]+.[a-z]+\/?/i }, allow_blank: true
  validates :photo_url, format: { with: /\A((http|https)?:\/\/)?(www.)?[a-zA-Z0-9]+.[a-z]+\/?/i }, allow_blank: true

  before_save :smart_add_url_protocol

  def display_link_url
    self.link_url = link_url.split("://").last unless link_url.blank?
  end

  private

    def smart_add_url_protocol
      unless self.link_url[/\Ahttp:\/\//] || self.link_url[/\Ahttps:\/\//]
        self.link_url = "https://#{self.link_url}" unless link_url.blank?
      end
      unless self.photo_url[/\Ahttp:\/\//] || self.photo_url[/\Ahttps:\/\//]
        self.photo_url = "https://#{self.photo_url}" unless photo_url.blank?
      end
    end

end
