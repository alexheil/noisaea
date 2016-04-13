class ArtistMerch < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  has_attached_file :item_img, styles: { perfect: "1000x1000#", small: "382x382#" }

  validates_attachment_content_type :item_img, content_type: /\Aimage\/.*\Z/

  belongs_to :artist
  belongs_to :fan

  has_many :artist_merch_purchases

  default_scope -> { order('id DESC') }

  validates :title, presence: true
  validates :category, presence: true
  validates :description, length: { maximum: 14216 }, allow_blank: true
  validates :base_price, presence: true, length: { maximum: 6 }, numericality: { greater_than: 0}
  validates :shipping_price, length: { maximum: 6 }, numericality: { greater_than: -1}
  validates :quantity, presence: true, length: { maximum: 4 }, numericality: { greater_than: 0}
  validates :currency, presence: true

  before_save :total_price_calculator
  before_save :should_generate_new_friendly_id?, if: :title_changed?

  def options_for_merch
    if self.options.include? ","
      self.options.split(/\s*,\s*/)
    else
      [self.options]
    end
  end

  private


    def should_generate_new_friendly_id?
      title_changed?
    end

    def total_price_calculator
      self.total_price = base_price + shipping_price
    end

end
