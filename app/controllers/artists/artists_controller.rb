class Artists::ArtistsController < ApplicationController
  def index
    @artists = Artist.all
  end

  def show
    @artist = Artist.friendly.find(params[:id])
  end

  def followers
    @artist = Artist.friendly.find(params[:artist_id])
  end

end

