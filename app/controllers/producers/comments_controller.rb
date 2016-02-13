class Producers::CommentsController < ApplicationController

  before_action :authenticate_commenter, only: :create

  def create
    @comment = ProducerMicropostComment.new(comment_params)
    @comment.producer_micropost_id = ProducerMicropost.find(params[:micropost_id]).id
    @producer = Producer.friendly.find(ProducerMicropost.find(params[:micropost_id]).producer_id)
    @micropost = ProducerMicropost.find(params[:micropost_id])
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
      flash.now[:notice] = "you posted a comment on #{@producer.producer_name}'s status."
      send_comment_email
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
    ProducerMicropostComment.find(params[:id]).destroy
    @producer = Producer.friendly.find(ProducerMicropost.find(params[:micropost_id]).producer_id)
    @micropost = ProducerMicropost.find(params[:micropost_id])
    flash.now[:notice] = "you successfully deleted your comment."
    respond_to do |format|
      format.html { redirect_to (:back) }
      format.js { render :action => "comments" }
    end
  end

  private

    def send_comment_email
      return if @producer.id == current_producer.id
      ProducerMailer.comment_email(@producer, @micropost).deliver_now unless @producer.comment_email == false
    end

    def authenticate_commenter
      redirect_to sign_in_path unless fan_signed_in? || artist_signed_in? || record_label_signed_in? || venue_signed_in? || producer_signed_in?
    end

    def comment_params
      params.require(:producer_micropost_comment).permit(:content)
    end
end
