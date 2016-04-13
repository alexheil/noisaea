class Artists::PaymentSettingsController < ApplicationController

  before_action :authenticate_artist!
  before_action :correct_artist
  before_action :set_artist
  before_action :have_merchant_account, only: [:new, :create]

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
        type: 'individual'
      }
    )

    if @account.save
      @payment = @artist.create_artist_payment_setting(
        first_name: @account.legal_entity.first_name,
        last_name: @account.legal_entity.last_name,
        month: @account.legal_entity.dob.month,
        day: @account.legal_entity.dob.day,
        year: @account.legal_entity.dob.year,
        currency: @account.default_currency,
        country: @account.country,
        stripe_id: @account.id
      )
      redirect_to edit_artist_payment_setting_path(@artist, @payment)
      flash[:notice] = "before we can transfer your payments we need more information."
    else
      redirect_to artist_path(@artist)
      flash[:alert] = "your merchant account failed to create."
    end

  end

  def edit
    @payment = @artist.artist_payment_setting
  end

  def update
    @payment = @artist.artist_payment_setting

    Stripe.api_key = Rails.configuration.stripe[:secret_key]
    account = Stripe::Account.retrieve(@payment.stripe_id)

    if params[:artist_payment_setting][:bank_account_number].present?
      account.external_accounts.create(
        external_account: {
          object: 'bank_account',
          account_number: params[:artist_payment_setting][:bank_account_number],
          routing_number: params[:artist_payment_setting][:bank_routing_number],
          country: account.country,
          currency: params[:artist_payment_setting][:currency]
        }
      )
    end

    account.legal_entity.address.line1 = params[:artist_payment_setting][:line1]
    account.legal_entity.address.city = params[:artist_payment_setting][:city]
    account.legal_entity.address.postal_code = params[:artist_payment_setting][:postal_code]
    account.legal_entity.personal_address.line1 = params[:artist_payment_setting][:line1]
    account.legal_entity.personal_address.city = params[:artist_payment_setting][:city]
    account.legal_entity.personal_address.postal_code = params[:artist_payment_setting][:postal_code]
    account.legal_entity.address.state = params[:artist_payment_setting][:state]
    account.legal_entity.ssn_last_4 = params[:artist_payment_setting][:ssn_last_4] if params[:artist_payment_setting][:ssn_last_4]
    account.legal_entity.personal_id_number = params[:artist_payment_setting][:personal_id_number] if params[:artist_payment_setting][:personal_id_number]
    account.default_currency = params[:artist_payment_setting][:currency]

    account.save

    if account.save
      @payment.update_attributes(
        first_name: params[:artist_payment_setting][:first_name],
        last_name: params[:artist_payment_setting][:last_name],
        month: params[:artist_payment_setting][:month],
        day: params[:artist_payment_setting][:day],
        year: params[:artist_payment_setting][:year],
       currency: account.default_currency
      )
      if @payment.save
      redirect_to artist_path(@artist)
      flash[:notice] = "you've updated your merchant account."
      else
        render 'edit'
      end
    else
      redirect_to artist_path(@artist)
      flash[:alert] = "your merchant account failed to update."
    end

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

    def have_merchant_account
      @artist = current_artist
      if @artist.artist_payment_setting
        @payment = @artist.artist_payment_setting
        redirect_to edit_artist_payment_setting_path(@artist, @payment) if @payment.country.present?
      end
    end

end
