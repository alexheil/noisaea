class Producers::RelationshipsController < ApplicationController

  before_action :authenticate_fan!

  def create
    @relationship = ProducerRelationship.new
    @relationship.fan_id = current_fan.id
    @relationship.producer_id = Producer.friendly.find(params[:producer_id]).id
    @producer = Producer.friendly.find(params[:producer_id])
    if @relationship.save
      flash.now[:notice] = "you followed #{@producer.producer_name}!"
      ProducerMailer.follow_email(@producer).deliver
      respond_to do |format|
        format.html { redirect_to (:back) }
        format.js { render :action => "follow_button" }
      end
    else
      redirect_to root_url
    end
  end

  def destroy
    current_fan.unfollow_producer(Producer.friendly.find(params[:producer_id]))
    @producer = Producer.friendly.find(params[:producer_id])
    flash.now[:notice] = "you unfollowed #{@producer.producer_name}!"
    respond_to do |format|
      format.html { redirect_to (:back) }
      format.js { render :action => "follow_button" }
    end
  end

end
