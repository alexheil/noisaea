class Recordlabels::RelationshipsController < ApplicationController

  before_action :authenticate_fan!

  def create
    @relationship = RecordLabelRelationship.new
    @relationship.fan_id = current_fan.id
    @relationship.record_label_id = RecordLabel.friendly.find(params[:record_label_id]).id
    @record_label = RecordLabel.friendly.find(params[:record_label_id])
    if @relationship.save
      flash.now[:notice] = "you followed #{@record_label.label_name}!"
      RecordLabelMailer.follow_email(@record_label).deliver
      respond_to do |format|
        format.html { redirect_to (:back) }
        format.js { render :action => "follow_button" }
      end
    else
      redirect_to (:back)
      flash[:notice] = "for some reason this did not work."
    end
  end

  def destroy
    current_fan.unfollow_record_label(RecordLabel.friendly.find(params[:record_label_id]))
    @record_label = RecordLabel.friendly.find(params[:record_label_id])
    flash.now[:notice] = "you unfollowed #{@record_label.label_name}!"
    respond_to do |format|
      format.html { redirect_to (:back) }
      format.js { render :action => "follow_button" }
    end
  end

end
