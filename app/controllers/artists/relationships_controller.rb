class Artists::RelationshipsController < ApplicationController

  before_action :authenticate_fan!

  def create
    @relationship = ArtistRelationship.new
    @relationship.fan_id = current_fan.id
    @relationship.artist_id = Artist.friendly.find(params[:artist_id]).id
    if @relationship.save
      redirect_to (:back)
    else
      redirect_to root_url
    end
  end

  def destroy
    current_fan.unfollow_artist(Artist.friendly.find(params[:id]))
    redirect_to (:back)
  end

end
