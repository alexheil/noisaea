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
      country: params[:artist_payment_settting][:country],
      email: @artist.email,
      tos_acceptance: {
        ip: request.remote_ip,
        date: Time.now.to_i
      },
      legal_entity: {
        dob: {
          day: params[:artist_payment_settting][:day],
          month: params[:artist_payment_settting][:month],
          year: params[:artist_payment_settting][:year]
        },
        first_name: params[:artist_payment_settting][:first_name],
        last_name: params[:artist_payment_settting][:last_name],
        type: 'individual',
      }
    )

    if @account.save
      @payment = @artist.create_artist_payment_setting(
          currency: @account.default_currency,
          country: @account.country,
          stripe_id: @account.id,
          stripe_secret_key: @account.keys.secret,
          stripe_publishable_key: @account.keys.publishable
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
