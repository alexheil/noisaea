class Artists::AlbumsController < ApplicationController

  before_action :authenticate_artist!, except: [:index, :show]
  before_action :correct_artist, except: [:index, :show, :edit, :update, :destroy]
  before_action :set_artist, except: [:index, :show]
  before_action :correct_album_artist, only: [:edit, :update, :destroy]

  def index
    @artist = Artist.friendly.find(params[:artist_id])
  end

  def show
    @artist = Artist.friendly.find(params[:artist_id])
    @album = ArtistAlbum.friendly.find(params[:id])
  end

  def new
    @album = ArtistAlbum.new
  end

  def create
    @album = @artist.artist_albums.build(album_params)
    if @album.save
      redirect_to artist_albums_path(@artist)
      flash[:notice] = "you've successfully added a album!"
    else
      render 'new'
      flash.now[:alert] = "you've failed!"
    end
  end

  def edit
    @album = ArtistAlbum.friendly.find(params[:id])
  end

  def update
    @album = ArtistAlbum.friendly.find(params[:id])
    if @album.update_attributes(album_params)
      redirect_to artist_album_path(@artist, @album)
      flash[:notice] = "you've successfully updated your album!"
    else
      render 'edit'
      flash.now[:alert] = "you've failed!"
    end
  end

  def destroy
    @album = ArtistAlbum.friendly.find(params[:id])
    @album.destroy
    redirect_to artist_albums_path(@artist)
  end

  private

    def set_artist
      @artist = current_artist
    end

    def correct_artist
      @artist = current_artist
      redirect_to artist_path(Artist.friendly.find(params[:artist_id])) if @artist != Artist.friendly.find(params[:artist_id])
    end

    def correct_album_artist
      @album = ArtistAlbum.friendly.find(params[:id])
      redirect_to artist_path(@album.artist_id) if @album.artist_id != current_artist.id
    end

    def album_params
      params.require(:artist_album).permit(:artist_id, :title, :description, :month, :day, :year, :price, :currency, :album_url, :cover_art_url, :slug)
    end

end
