class StaticPagesController < ApplicationController

  before_action :redirect_if_signed_in, only: [:register, :sign_in]

  def home
  end

  def privacy
  end

  def terms_of_use
  end

  def contact
  end

  def about
  end

  def faq
  end

  def copyright
  end

  def register
  end

  def sign_in
  end

  def why
  end

  def stats
  end

  def resources
  end

  def contest
  end

  def join
  end

  private

  def redirect_if_signed_in
    if artist_signed_in? || fan_signed_in? || record_label_signed_in? || venue_signed_in? || producer_signed_in?
      redirect_to root_url
      flash[:notice] = " you are signed in"
    end
  end

end
