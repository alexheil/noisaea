class Artists::ProfilesController < ApplicationController

  before_action :authenticate_artist!
  before_action :correct_artist
  before_action :set_artist

  def edit
    @profile = @artist.artist_profile
  end

  def update
    @profile = @artist.artist_profile
    if @profile.update_attributes(profile_params)
      flash[:notice] = "you've successfully updated your profile!"
      redirect_to current_artist
    else
      render 'edit'
      flash[:alert] = "you failed =/"
    end
  end

  private

    def set_artist
      @artist = current_artist
    end

    def correct_artist
      @artist = current_artist
      redirect_to artist_path(Artist.friendly.find(params[:artist_id])) if @artist != Artist.friendly.find(params[:artist_id])
      flash[:alert] = "this is not your profile."
    end

    def profile_params
      params.require(:artist_profile).permit(:biography, :location, :genre, :members, :website, :facebook_url, :twitter_url, :youtube_url, :itunes_url, :amazon_url, :google_play_url, :ticketfly_url, :record_label, :cover_image, :profile_image)
    end

end
