class Producers::ProfilesController < ApplicationController

  before_action :authenticate_producer!
  before_action :correct_producer
  before_action :set_producer

  def edit
    @profile = @producer.producer_profile
  end

  def update
    @profile = @producer.producer_profile
    if @profile.update_attributes(profile_params)
      redirect_to current_producer
      flash[:notice] = "you've successfully updated your profile!"
    else
      render 'edit'
      flash[:alert] = "you failed =/"
    end
  end

  private

    def set_producer
      @producer = current_producer
    end

    def correct_producer
      @producer = Producer.friendly.find(params[:producer_id])
      if current_producer != @producer
        redirect_to producer_path(@producer)
        flash[:alert] = "this is not your profile."
      end
    end

    def profile_params
      params.require(:producer_profile).permit(:biography, :location, :genre, :artists, :founded, :facebook_url, :twitter_url, :youtube_url, :website, :letlyrics_url, :theme_color, :cover_image, :profile_image, :cover_img, :profile_img, :cover_img, :profile_img)
    end

end
