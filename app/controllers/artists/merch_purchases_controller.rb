class Artists::MerchPurchasesController < ApplicationController

  before_action :authenticate_artist!, only: :index
  before_action :authenticate_fan!, only: [:create, :checkout, :charge, :edit]
  before_action :authenticate_artist_or_fan, only: :update
  before_action :correct_fan, only: [:checkout, :charge, :edit, :update]
  before_action :correct_purchase_artist, only: [:index, :update]
  before_action :already_charged, only: [:checkout, :charge]
  before_action :need_payment, only: [:edit, :update]

  def index
    @artist = current_artist
    @purchases = @artist.artist_merch_purchases
  end

  def create
    @artist = Artist.friendly.find(params[:artist_id])
    @merch = ArtistMerch.friendly.find(params[:merch_id])
    @purchase = @merch.artist_merch_purchases.build(purchase_params)
    @fan = current_fan

    @purchase.artist_id = @artist.id
    @purchase.fan_id = @fan.id
    @purchase.complete_price = (@merch.total_price * @purchase.quantity) + @purchase.pay_your_own_price

    if @purchase.save
      redirect_to checkout_artist_merch_purchase_path(@artist, @merch, @purchase)
      flash[:notice] = "how will you pay this?"
    else
      redirect_to artist_merch_path(@artist, @merch)
      flash.now[:alert] = "you have failed."
    end
  end

  def checkout
    @artist = Artist.friendly.find(params[:artist_id])
    @merch = ArtistMerch.friendly.find(params[:merch_id])
    @purchase = ArtistMerchPurchase.find(params[:id])
    @fan = current_fan
  end

  def charge
    @artist = Artist.friendly.find(params[:artist_id])
    @merch = ArtistMerch.friendly.find(params[:merch_id])
    @purchase = ArtistMerchPurchase.find(params[:id])
    @fan = current_fan

    Stripe.api_key = Rails.configuration.stripe[:secret_key]
    token = params[:stripeToken]
    amount = ((@purchase.complete_price) * 100)
    noisaea_fee = ((@purchase.complete_price * 0.184 + 0.30) * 100).round

    begin
      charge = Stripe::Charge.create(
        amount: amount,
        application_fee: noisaea_fee,
        currency: @artist.artist_payment_setting.currency,
        destination: @artist.artist_payment_setting.stripe_id,
        source: token,
        description: "#{@artist.artist_name} | Noisaea"
      )
    rescue Stripe::CardError => e
      # The card has been declined
    end

    if charge.save
      @purchase.update_attributes(
        stripe_charge_id: charge.id
      )
      send_purchase_email
      redirect_to edit_artist_merch_purchase_path(@artist, @merch, @purchase)
      flash[:notice] = "#{@artist.artist_name} needs to know where to ship this."
    else
      render 'checkout'
      flash.now[:alert] = "you have failed."
    end
  end

  def edit
    @artist = Artist.friendly.find(params[:artist_id])
    @merch = ArtistMerch.friendly.find(params[:merch_id])
    @purchase = ArtistMerchPurchase.find(params[:id])
  end

  def update
    @artist = Artist.friendly.find(params[:artist_id])
    @merch = ArtistMerch.friendly.find(params[:merch_id])
    @purchase = ArtistMerchPurchase.find(params[:id])
    if fan_signed_in? && @purchase.update_attributes(purchase_params)
      redirect_to artist_path(@artist)
      flash[:notice] = "you have successfully completed your order."
    elsif artist_signed_in? && @purchase.update_attributes(is_shipped: true)
      @fan = Fan.friendly.find(@purchase.fan)
      send_fan_email
      redirect_to artist_merch_transactions_path(@artist)
      flash[:notice] = "order has been marked 'shipped'."
    else
      render 'edit'
      flash.now[:alert] = "you have failed."
    end
  end

  private

    def send_purchase_email
      ArtistMailer.purchased_email(@artist, @purchase, @fan).deliver_now
    end

    def send_fan_email
      FanMailer.purchased_email(@fan, @artist, @purchase).deliver_now
    end

    def authenticate_artist_or_fan
      authenticate_fan! unless artist_signed_in?
    end

    def correct_fan
      if fan_signed_in?
        @purchase = ArtistMerchPurchase.find(params[:id])
        if fan_signed_in? && @purchase.fan_id != current_fan.id
          redirect_to artist_path(@purchase.artist)
          flash.now[:alert] = "that was not your order."
        end
      end
    end

    def correct_purchase_artist
      if artist_signed_in?
        redirect_to artist_path(Artist.friendly.find(params[:artist_id])) unless current_artist == Artist.friendly.find(params[:artist_id])
      end
    end

    def already_charged
      @artist = Artist.friendly.find(params[:artist_id])
      @merch = ArtistMerch.friendly.find(params[:merch_id])
      @purchase = ArtistMerchPurchase.find(params[:id])
      if @purchase.stripe_charge_id.present?
        redirect_to edit_artist_merch_purchase_path(@artist, @merch, @purchase)
        flash.now[:alert] = "you have already paid for this. where should it be shipped?"
      end
    end

    def need_payment
      @artist = Artist.friendly.find(params[:artist_id])
      @merch = ArtistMerch.friendly.find(params[:merch_id])
      @purchase = ArtistMerchPurchase.find(params[:id])
      if @purchase.stripe_charge_id.blank?
        redirect_to checkout_artist_merch_purchase_path(@artist, @merch, @purchase)
        flash.now[:alert] = "you need to process a payment first."
      end
    end

    def purchase_params
      params.require(:artist_merch_purchase).permit(:artist_id, :artist_merch_id, :fan_id, :stripe_charge_id, :quantity, :options, :pay_your_own_price, :complete_price, :full_name, :street_address, :city, :state, :country, :zip_code, :is_shipped)
    end

end
