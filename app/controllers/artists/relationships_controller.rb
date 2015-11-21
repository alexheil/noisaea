class Artists::RelationshipsController < ApplicationController

  before_action :authenticate_fan!

  def create
    @relationship = ArtistRelationship.new
    @relationship.fan_id = current_fan.id
    @relationship.artist_id = Artist.friendly.find(params[:artist_id]).id
    @artist = Artist.friendly.find(params[:artist_id])
    if @relationship.save
      flash.now[:notice] = "you followed #{@artist.artist_name}!"
      respond_to do |format|
        format.html { redirect_to (:back) }
        format.js { render :action => "follow_button" }
      end
    else
      redirect_to root_url
    end
  end

  def destroy
    current_fan.unfollow_artist(Artist.friendly.find(params[:artist_id]))
    @artist = Artist.friendly.find(params[:artist_id])
    flash.now[:notice] = "you unfollowed #{@artist.artist_name}!"
    respond_to do |format|
      format.html { redirect_to (:back) }
      format.js { render :action => "follow_button" }
    end
  end

end
