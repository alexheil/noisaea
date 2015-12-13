class Artists::ShowsController < ApplicationController

  before_action :authenticate_artist!, except: [:index, :show]
  before_action :correct_artist, except: [:index, :show, :edit, :update, :destroy]
  before_action :set_artist, except: :index
  before_action :correct_show_artist, only: [:edit, :update, :destroy]

  def index
    @artist = Artist.friendly.find(params[:artist_id])
  end

  def show
    @artist = Artist.friendly.find(params[:artist_id])
    @show = ArtistShow.find(params[:id])
  end

  def new
    @show = ArtistShow.new
  end

  def create
    @show = @artist.artist_shows.build(show_params)
    if @show.save
      redirect_to artist_shows_path(@artist)
      flash[:notice] = "you've successfully added a show!"
    else
      render 'new'
      flash.now[:alert] = "you've failed!"
    end
  end

  def edit
    @show = ArtistShow.find(params[:id])
  end

  def update
    @show = ArtistShow.find(params[:id])
    if @show.update_attributes(show_params)
      redirect_to artist_show_path(@artist, @show)
      flash[:notice] = "you've successfully updated your show!"
    else
      render 'edit'
      flash.now[:alert] = "you've failed!"
    end
  end

  def destroy
    @show = ArtistShow.find(params[:id])
    @show.destroy
    redirect_to artist_shows_path(@artist)
  end

  private

    def set_artist
      @artist = current_artist
    end

    def correct_artist
      @artist = current_artist
      redirect_to artist_path(Artist.friendly.find(params[:artist_id])) if @artist != Artist.friendly.find(params[:artist_id])
    end

    def correct_show_artist
      @show = ArtistShow.find(params[:id])
      redirect_to artist_path(@show.artist_id) if @show.artist_id != current_artist.id
    end

    def show_params
      params.require(:artist_show).permit(:artist_id, :month, :day, :year, :location, :venue, :description, :ticket_url, :flyer_url)
    end

end
