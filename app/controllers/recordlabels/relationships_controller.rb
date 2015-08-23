class Recordlabels::RelationshipsController < ApplicationController

  before_action :authenticate_fan!

  def create
    @relationship = RecordLabelRelationship.new
    @relationship.fan_id = current_fan.id
    @relationship.record_label_id = RecordLabel.friendly.find(params[:record_label_id]).id
    if @relationship.save
      redirect_to (:back)
    else
      redirect_to root_url
    end
  end

  def destroy
    current_fan.unfollow_record_label(RecordLabel.friendly.find(params[:id]))
    redirect_to (:back)
  end

end
