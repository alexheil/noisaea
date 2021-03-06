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
      @artist = Artist.friendly.find(params[:artist_id])
      if current_artist != @artist
        redirect_to artist_path(@artist)
        flash[:alert] = "this is not your profile."
      end
    end

    def profile_params
      params.require(:artist_profile).permit(:biography, :location, :genre, :members, :website, :facebook_url, :twitter_url, :youtube_url, :itunes_url, :amazon_url, :google_play_url, :ticketfly_url, :letlyrics_url, :theme_color, :record_label, :cover_image, :profile_image, :cover_img, :profile_img, :cover_img, :profile_img, :cover_img, :profile_img)
    end

end
