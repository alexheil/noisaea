class Recordlabels::MicropostVotesController < ApplicationController

  before_action :authenticate_voter, only: :create

  def create
    @vote = RecordLabelMicropostVote.new
    @record_label = RecordLabel.friendly.find(params[:record_label_id])
    @micropost = RecordLabelMicropost.find(params[:micropost_id])
    @vote.record_label_micropost_id = @micropost.id
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
        format.js { render :action => "micropost_votes" }
      end
    else
      redirect_to (:back)
      flash[:alert] = "you suck."
    end
  end

  def destroy
    @record_label = RecordLabel.friendly.find(params[:record_label_id])
    @micropost = RecordLabelMicropost.find(params[:micropost_id])
    if fan_signed_in?
      current_fan.record_label_micropost_unvote(@micropost)
    elsif artist_signed_in?
      current_artist.record_label_micropost_unvote(@micropost)
    elsif record_label_signed_in?
      current_record_label.record_label_micropost_unvote(@micropost)
    elsif venue_signed_in?
      current_venue.record_label_micropost_unvote(@micropost)
    elsif producer_signed_in?
      current_producer.record_label_micropost_unvote(@micropost)
    end
    respond_to do |format|
      format.html { redirect_to (:back) }
      format.js { render :action => "micropost_votes" }
    end
  end

  private

    def authenticate_voter
      redirect_to sign_in_path unless fan_signed_in? || artist_signed_in? || record_label_signed_in? || venue_signed_in? || producer_signed_in?
    end

end
