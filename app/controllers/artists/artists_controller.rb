class Artists::ArtistsController < ApplicationController

  def index
    if params[:search]
      @artists = Artist.search(params[:search]).order("created_at DESC")
    else
      @artists = Artist.all
    end
  end

  def show
    @artist = Artist.friendly.find(params[:id])
  end

  def followers
    @artist = Artist.friendly.find(params[:artist_id])
  end

  def merch
    @merch = ArtistMerch.all
  end

  def shows
    @shows = ArtistShow.all
  end

  def videos
    @videos = ArtistVideo.all
  end

  def microposts
    @microposts = ArtistMicropost.all
  end

end

