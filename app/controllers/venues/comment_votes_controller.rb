class Venues::CommentVotesController < ApplicationController

  before_action :authenticate_voter, only: :create

  def create
    @vote = VenueMicropostCommentVote.new
    @venue = Venue.friendly.find(params[:venue_id])
    @micropost = VenueMicropost.find(params[:micropost_id])
    @comment = VenueMicropostComment.find(params[:comment_id])
    @vote.venue_micropost_comment_id = @comment.id
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
      current_fan.venue_micropost_comment_unvote(@comment)
    elsif artist_signed_in?
      current_artist.venue_micropost_comment_unvote(@comment)
    elsif record_label_signed_in?
      current_record_label.venue_micropost_comment_unvote(@comment)
    elsif venue_signed_in?
      current_venue.venue_micropost_comment_unvote(@comment)
    elsif producer_signed_in?
      current_producer.avenue_micropost_comment_unvote(@comment)
    end
    respond_to do |format|
      format.html { redirect_to (:back) }
      format.js { render :action => "comment_votes" }
    end
  end

  private

    def authenticate_voter
      redirect_to sign_in_path unless fan_signed_in? || artist_signed_in? || record_label_signed_in? || venue_signed_in? || producer_signed_in?
    end

end
