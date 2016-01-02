class ArtistMerch < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :artist
  belongs_to :fan

  default_scope -> { order('id DESC') }

  validates :title, presence: true
  validates :category, presence: true
  validates :description, length: { maximum: 14216 }, allow_blank: true
  validates :base_price, presence: true, length: { maximum: 6 }, numericality: { greater_than: 0}
  validates :shipping_price, length: { maximum: 6 }, numericality: { greater_than: 0}, allow_blank: true
  validates :quantity, presence: true, length: { maximum: 4 }, numericality: { greater_than: 0}
  validates :currency, presence: true
  validates :merch_url, presence: true, format: { with: /\A(http|https):\/\/|[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,6}(:[0-9]{1,5})?(\/.*)?\z/ix }
  validates :image_url, format: { with: /\A(http|https):\/\/|[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,6}(:[0-9]{1,5})?(\/.*)?\z/ix }

  before_save :total_price_calculator

  private

    def total_price_calculator
      self.total_price = base_price + shipping_price
    end

end
