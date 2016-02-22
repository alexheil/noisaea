class Artists::ArtistsController < ApplicationController

  def index
    if params[:search]
      @artists = Artist.search(params[:search]).order("created_at DESC")
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

end

