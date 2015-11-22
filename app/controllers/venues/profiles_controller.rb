class Venues::ProfilesController < ApplicationController

  before_action :authenticate_venue!
  before_action :correct_venue
  before_action :set_venue

  def edit
    @profile = @venue.venue_profile
  end

  def update
    @profile = @venue.venue_profile
    if @profile.update_attributes(profile_params)
      flash[:notice] = "you've successfully updated your profile!"
      redirect_to current_venue
    else
      render 'edit'
      flash[:alert] = "you failed =/"
    end
  end

  private

    def set_venue
      @venue = current_venue
    end

    def correct_venue

      @venue = current_venue
      redirect_to venue_path(Venue.friendly.find(params[:venue_id])) if @venue != Venue.friendly.find(params[:venue_id])
    end

    def profile_params
      params.require(:venue_profile).permit(:biography, :location, :founded, :facebook_url, :twitter_url, :youtube_url, :cover_image, :profile_image)
    end

end
