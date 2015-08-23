class Producers::RelationshipsController < ApplicationController

  before_action :authenticate_fan!

  def create
    @relationship = ProducerRelationship.new
    @relationship.fan_id = current_fan.id
    @relationship.producer_id = Producer.friendly.find(params[:producer_id]).id
    if @relationship.save
      redirect_to (:back)
    else
      redirect_to root_url
    end
  end

  def destroy
    current_fan.unfollow_producer(Producer.friendly.find(params[:id]))
    redirect_to (:back)
  end

end
