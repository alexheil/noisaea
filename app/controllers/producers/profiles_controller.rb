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
      flash[:notice] = "your profile was updated!"
    else
      render 'edit'
      flash[:notice] = "you failed =/"
    end
  end

  private

    def set_producer
      @producer = current_producer
    end

    def correct_producer
      @producer = current_producer
      redirect_to producer_path(Producer.friendly.find(params[:producer_id])) if @producer != Producer.friendly.find(params[:producer_id])
    end

    def profile_params
      params.require(:producer_profile).permit(:biography, :location, :genre, :artists, :founded, :facebook_url, :twitter_url, :youtube_url, :website, :cover_image, :profile_image)
    end

end
