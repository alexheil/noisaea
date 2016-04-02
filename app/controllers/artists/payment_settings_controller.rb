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
      country: params[:artist_payment_setting][:country],
      email: @artist.email,
      tos_acceptance: {
        ip: request.remote_ip,
        date: Time.now.to_i
      },
      legal_entity: {
        dob: {
          month: params[:artist_payment_setting][:month],
          day: params[:artist_payment_setting][:day],
          year: params[:artist_payment_setting][:year]
        },
        first_name: params[:artist_payment_setting][:first_name],
        last_name: params[:artist_payment_setting][:last_name],
        type: 'individual',
      }
    )

    if @account.save
      @payment = @artist.create_artist_payment_setting(
        artist_id: @artist.id,
        first_name: @artist.first_name,
        last_name: @artist.last_name,
        month: @artist.month,
        day: @artist.day,
        year: @artist.year,
        currency: @account.default_currency,
        country: @account.country,
        stripe_id: @account.id
      )
      if @payment.save
        redirect_to artist_path(@artist)
      else
        redirect_to root_url
      end
    end

  end

  def edit
    @payment = @artist.artist_payment_setting
  end

  def update
    @payment = @artist.artist_payment_setting

    Stripe.api_key = Rails.configuration.stripe[:secret_key]
    account = Stripe::Account.retrieve(@payment.stripe_id)

    account.legal_entity.address.line1 = params[:artist_payment_setting][:line1]
    account.legal_entity.address.city = params[:artist_payment_setting][:city]
    account.legal_entity.address.postal_code = params[:artist_payment_setting][:postal_code]
    account.legal_entity.address.state = params[:artist_payment_setting][:state]
    account.legal_entity.ssn_last_4 = params[:artist_payment_setting][:ssn_last_4]

    account.save

    redirect_to artist_path(@artist)
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
