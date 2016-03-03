class Venues::VenuesController < ApplicationController

  def index
    if params[:search]
      @venues = Venue.search(params[:search]).order("created_at DESC").page params[:page]
    else
      @venues = Venue.all.page params[:page]
    end
  end

  def show
    @venue = Venue.friendly.find(params[:id])
    @microposts = @venue.venue_microposts.page params[:page]
  end

  def followers
    @venue = Venue.friendly.find(params[:venue_id])
    @followers = @venue.fans.page params[:page]
  end

end
