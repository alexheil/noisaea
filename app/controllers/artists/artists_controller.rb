class Artists::ArtistsController < ApplicationController

  def index
    if params[:search]
      @artists = Artist.search(params[:search]).order("created_at DESC").page params[:page]
    else
      @artists = Artist.page params[:page]
    end
  end

  def show
    @artist = Artist.friendly.find(params[:id])
    @microposts = @artist.artist_microposts.page params[:page]
  end

  def followers
    @artist = Artist.friendly.find(params[:artist_id])
    @followers = @artist.fans.page params[:page]
  end

  def merch
    @merch = ArtistMerch.page params[:page]
  end

  def shows
    @shows = ArtistShow.page params[:page]
  end

  def videos
    @videos = ArtistVideo.page params[:page]
  end

  def microposts
    @microposts = ArtistMicropost.page params[:page]
  end

  def quick_register
    if artist_signed_in?
      redirect_to artist_path(current_artist)
      flash.now[:notice] = "you are already signed in"
    end
  end

end

