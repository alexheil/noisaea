class Venues::RelationshipsController < ApplicationController

  before_action :authenticate_fan!

  def create
    @relationship = VenueRelationship.new
    @relationship.fan_id = current_fan.id
    @relationship.venue_id = Venue.friendly.find(params[:venue_id]).id
    if @relationship.save
      redirect_to (:back)
    else
      redirect_to root_url
    end
  end

  def destroy
    current_fan.unfollow_venue(Venue.friendly.find(params[:id]))
    redirect_to (:back)
  end

end
