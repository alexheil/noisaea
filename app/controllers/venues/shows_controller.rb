class Venues::ShowsController < ApplicationController

  before_action :authenticate_venue!, except: [:index, :show]
  before_action :correct_venue, except: [:index, :show, :edit, :update, :destroy]
  before_action :set_venue, except: [:index, :show]
  before_action :correct_show_venue, only: [:edit, :update, :destroy]

  def index
    @venue = Venue.friendly.find(params[:venue_id])
    @shows = @venue.venue_shows.page params[:page]
  end

  def show
    @venue = Venue.friendly.find(params[:venue_id])
    @show = VenueShow.find(params[:id])
  end

  def new
    @show = VenueShow.new
  end

  def create
    @show = @venue.venue_shows.build(show_params)
    if @show.save
      redirect_to venue_shows_path(@venue)
      flash[:notice] = "you've successfully added a show!"
    else
      render 'new'
      flash.now[:alert] = "you've failed!"
    end
  end

  def edit
    @show = VenueShow.find(params[:id])
  end

  def update
    @show = VenueShow.find(params[:id])
    if @show.update_attributes(show_params)
      redirect_to venue_show_path(@venue, @show)
      flash[:notice] = "you've successfully updated your show!"
    else
      render 'edit'
      flash.now[:alert] = "you've failed!"
    end
  end

  def destroy
    @show = VenueShow.find(params[:id])
    @show.destroy
    redirect_to venue_shows_path(@venue)
  end

  private

    def set_venue
      @venue = current_venue
    end

    def correct_venue
      @venue = current_venue
      redirect_to venue_path(Venue.friendly.find(params[:venue_id])) if @venue != Venue.friendly.find(params[:venue_id])
    end

    def correct_show_venue
      @show = VenueShow.find(params[:id])
      redirect_to venue_path(@show.venue_id) if @show.venue_id != current_venue.id
    end

    def show_params
      params.require(:venue_show).permit(:venue_id, :artist, :month, :day, :year, :location, :show_venue, :description, :ticket_url, :flyer_url, :flyer_img, :headline_artist, :support_artist1, :support_artist2, :support_artist3, :support_artist4, :support_artist5, :support_artist6, :support_artist7)
    end

end
