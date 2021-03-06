class Venues::RelationshipsController < ApplicationController

  before_action :authenticate_fan!

  def create
    @relationship = VenueRelationship.new
    @relationship.fan_id = current_fan.id
    @relationship.venue_id = Venue.friendly.find(params[:venue_id]).id
    @venue = Venue.friendly.find(params[:venue_id])
    if @relationship.save
      flash.now[:notice] = "you followed #{@venue.venue_name}!"
      VenueMailer.follow_email(@venue).deliver_now unless @venue.follow_email == false
      respond_to do |format|
        format.html { redirect_to (:back) }
        format.js { render :action => "follow_button" }
      end
    else
      redirect_to (:back)
      flash[:notice] = "for some reason something went wrong"
    end
  end

  def destroy
    current_fan.unfollow_venue(Venue.friendly.find(params[:venue_id]))
    @venue = Venue.friendly.find(params[:venue_id])
    flash.now[:notice] = "you unfollowed #{@venue.venue_name}!"
    respond_to do |format|
      format.html { redirect_to (:back) }
      format.js { render :action => "follow_button" }
    end
  end

end
