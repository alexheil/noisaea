class Artists::PaymentSettingsController < ApplicationController

  before_action :authenticate_artist!
  before_action :correct_artist
  before_action :set_artist

  def new
    @payment = ArtistPaymentSetting.new
  end

  def create

    Stripe.api_key = Rails.configuration.stripe[:secret_key]
    @account = Stripe::Account.create(
      managed: true,
      country: params[:country],
      email: @artist.email,
      dob: {
        day: params[:day],
        month: params[:month],
        year: params[:year]
      },
      first_name: params[:first_name],
      last_name: params[:last_name],
      tos_acceptance: {
        ip: request.remote_ip,
        date: Time.now.to_i
      },
      legal_entity: {
        type: 'individual',
      }
    )

    if @account.save
      @payment = @artist.create_artist_payment_setting(
          currency: @account.default_currency,
          country: @account.country,
          stripe_id: @account.id,
          stripe_secret_key: @account.keys.secret,
          stripe_publishable_key: @account.keys.publishable,
        )
    end

    redirect_to artist_path(@artist)
  end

  def edit
  end

  def update
  end

  private

    def set_artist
      @artist = current_artist
    end

    def correct_artist
      @artist = Artist.friendly.find(params[:artist_id])
      if current_artist != @artist
        redirect_to artist_path(@artist)
        flash[:alert] = "this is not you."
      end
    end

end
