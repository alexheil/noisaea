class ArtistMicropost < ActiveRecord::Base
  belongs_to :artist
  belongs_to :fan

  has_many :artist_micropost_comments, dependent: :destroy

  has_many :artist_micropost_votes, dependent: :destroy

  has_many :artist_notifications, dependent: :destroy

  default_scope -> { order('id DESC') }

  validates :artist_id, presence: true
  validates :content, presence: true, length: { maximum: 14216 }
  validates :link_url, format: { with: /\A((http|https)?:\/\/)?(www.)?[a-zA-Z0-9]+.[a-z]+\/?/i }, allow_blank: true
  validates :photo_url, format: { with: /\A((http|https)?:\/\/)?(www.)?[a-zA-Z0-9]+.[a-z]+\/?/i }, allow_blank: true

  before_save :smart_add_url_protocol

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
