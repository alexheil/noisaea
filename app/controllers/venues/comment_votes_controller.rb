class Venues::CommentVotesController < ApplicationController

  before_action :authenticate_voter, only: :create

  def create
    @vote = VenueMicropostCommentVote.new
    @vote.venue_micropost_comment_id = VenueMicropostComment.find(params[:comment_id]).id
    @venue = Venue.friendly.find(params[:venue_id])
    @micropost = VenueMicropost.find(params[:micropost_id])
    @comment = VenueMicropostComment.find(params[:comment_id])
    if artist_signed_in?
      @vote.artist_id = current_artist.id
    elsif fan_signed_in?
      @vote.fan_id = current_fan.id
    elsif record_label_signed_in?
      @vote.record_label_id = current_record_label.id
    elsif venue_signed_in?
      @vote.venue_id = current_venue.id
    elsif producer_signed_in?
      @vote.producer_id = current_producer.id
    end
    if @vote.save
      respond_to do |format|
        format.html { redirect_to (:back) }
        format.js { render :action => "comment_votes" }
      end
    else
      redirect_to (:back)
      flash[:alert] = "you suck."
    end
  end

  def destroy
    @venue = Venue.friendly.find(params[:venue_id])
    @micropost = VenueMicropost.find(params[:micropost_id])
    @comment = VenueMicropostComment.find(params[:comment_id])
    if fan_signed_in?
      current_fan.venue_micropost_comment_unvote(VenueMicropostComment.find(params[:comment_id]))
    elsif artist_signed_in?
      current_artist.venue_micropost_comment_unvote(VenueMicropostComment.find(params[:comment_id]))
    elsif record_label_signed_in?
      current_record_label.venue_micropost_comment_unvote(VenueMicropostComment.find(params[:comment_id]))
    elsif venue_signed_in?
      current_venue.venue_micropost_comment_unvote(VenueMicropostComment.find(params[:comment_id]))
    elsif producer_signed_in?
      current_producer.avenue_micropost_comment_unvote(VenueMicropostComment.find(params[:comment_id]))
    end
    respond_to do |format|
      format.html { redirect_to (:back) }
      format.js { render :action => "comment_votes" }
    end
  end

  private

  def authenticate_voter
      (authenticate_fan! unless artist_signed_in? || record_label_signed_in? || venue_signed_in? || producer_signed_in?)
      (authenticate_artist! unless fan_signed_in? || record_label_signed_in? || venue_signed_in? || producer_signed_in?)
      (authenticate_record_label! unless artist_signed_in? || fan_signed_in? || venue_signed_in? || producer_signed_in?)
      (authenticate_venue! unless artist_signed_in? || fan_signed_in? || record_label_signed_in? || producer_signed_in?)
      (authenticate_producer! unless artist_signed_in? || fan_signed_in? || record_label_signed_in? || venue_signed_in?)
    end

end
