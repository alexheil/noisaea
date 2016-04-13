class ArtistMerchPurchase < ActiveRecord::Base
  belongs_to :artist_merch
  belongs_to :artist
  belongs_to :fan

  default_scope -> { order('id DESC') }

  validates :quantity, presence: true, numericality: { greater_than: 0 }
end
