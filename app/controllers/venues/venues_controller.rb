class Venues::VenuesController < ApplicationController

  def index
    if params[:search]
      @venues = Venue.search(params[:search]).order("created_at DESC")
    else
      @venues = Venue.all
    end
  end

  def show
    @venue = Venue.friendly.find(params[:id])
  end

  def followers
    @venue = Venue.friendly.find(params[:venue_id])
  end

end
