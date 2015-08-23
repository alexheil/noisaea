class Venues::VenuesController < ApplicationController

  def index
    @venues = Venue.all
  end

  def show
    @venue = Venue.friendly.find(params[:id])
  end

  def followers
    @venue = Venue.friendly.find(params[:venue_id])
  end

end
