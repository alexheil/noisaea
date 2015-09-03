class Venues::CommentVotesController < ApplicationController

  before_action :authenticate_voter, only: :create

  def create
    @vote = VenueMicropostCommentVote.new
    @vote.venue_micropost_comment_id = VenueMicropostComment.find(params[:venue_micropost_comment_id]).id
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
      redirect_to (:back)
      flash[:notice] = "you rock"
    else
      redirect_to (:back)
      flash[:alert] = "you suck."
    end
  end

  def destroy
    if fan_signed_in?
      current_fan.venue_micropost_comment_unvote(VenueMicropostComment.find(params[:id]))
      redirect_to (:back)
    elsif artist_signed_in?
      current_artist.venue_micropost_comment_unvote(VenueMicropostComment.find(params[:id]))
      redirect_to (:back)
    elsif record_label_signed_in?
      current_record_label.venue_micropost_comment_unvote(VenueMicropostComment.find(params[:id]))
      redirect_to (:back)
    elsif venue_signed_in?
      current_venue.venue_micropost_comment_unvote(VenueMicropostComment.find(params[:id]))
      redirect_to (:back)
    elsif producer_signed_in?
      current_producer.avenue_micropost_comment_unvote(VenueMicropostComment.find(params[:id]))
      redirect_to (:back)
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
