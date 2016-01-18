class Recordlabels::CommentsController < ApplicationController

  before_action :authenticate_commenter, only: :create

  def create
    @comment = RecordLabelMicropostComment.new(comment_params)
    @comment.record_label_micropost_id = RecordLabelMicropost.find(params[:micropost_id]).id
    @record_label = RecordLabel.friendly.find(RecordLabelMicropost.find(params[:micropost_id]).record_label_id)
    @micropost = RecordLabelMicropost.find(params[:micropost_id])
    if artist_signed_in?
      @comment.artist_id = current_artist.id
    elsif fan_signed_in?
      @comment.fan_id = current_fan.id
    elsif record_label_signed_in?
      @comment.record_label_id = current_record_label.id
    elsif venue_signed_in?
      @comment.venue_id = current_venue.id
    elsif producer_signed_in?
      @comment.producer_id = current_producer.id
    end
    if @comment.save
      flash.now[:notice] = "you posted a comment on #{@record_label.label_name}'s status."
      RecordLabelMailer.comment_email(@record_label, @micropost).deliver
      respond_to do |format|
        format.html { redirect_to (:back) }
        format.js { render :action => "comments" }
      end
    else
      redirect_to (:back)
      flash[:alert] = "you suck."
    end
  end

  def destroy
    RecordLabelMicropostComment.find(params[:id]).destroy
    @record_label = RecordLabel.friendly.find(RecordLabelMicropost.find(params[:micropost_id]).record_label_id)
    @micropost = RecordLabelMicropost.find(params[:micropost_id])
    flash.now[:notice] = "you successfully deleted your comment."
    respond_to do |format|
      format.html { redirect_to (:back) }
      format.js { render :action => "comments" }
    end
  end

  private

    def authenticate_commenter
      (authenticate_fan! unless artist_signed_in? || record_label_signed_in? || venue_signed_in? || producer_signed_in?)
      (authenticate_artist! unless fan_signed_in? || record_label_signed_in? || venue_signed_in? || producer_signed_in?)
      (authenticate_record_label! unless artist_signed_in? || fan_signed_in? || venue_signed_in? || producer_signed_in?)
      (authenticate_venue! unless artist_signed_in? || fan_signed_in? || record_label_signed_in? || producer_signed_in?)
      (authenticate_producer! unless artist_signed_in? || fan_signed_in? || record_label_signed_in? || venue_signed_in?)
    end

    def comment_params
      params.require(:record_label_micropost_comment).permit(:content)
    end
end
