class ArtistMerchPurchase < ActiveRecord::Base
  belongs_to :artist_merch
  belongs_to :artist
  belongs_to :fan

  default_scope -> { order('id DESC') }

  validates :quantity, presence: true, numericality: { greater_than: 0 }

   def self.artist_merch_need_to_pay_mailer
    ArtistMerchPurchase.where("stripe_charge_id" => nil).find_each do |purchase|
      FanMailer.need_to_pay_email(purchase.fan, purchase).deliver_now unless purchase.created_at < 7.days.ago
    end
  end

end
