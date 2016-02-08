class Artists::MicropostVotesController < ApplicationController

  before_action :authenticate_voter, only: :create

  def create
    @vote = ArtistMicropostVote.new
    @artist = Artist.friendly.find(params[:artist_id])
    @micropost = ArtistMicropost.find(params[:micropost_id])
    @vote.artist_micropost_id = @micropost.id
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
      create_notification(@micropost, @vote)
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
    @artist = Artist.friendly.find(params[:artist_id])
    @micropost = ArtistMicropost.find(params[:micropost_id])
    if fan_signed_in?
      current_fan.artist_micropost_unvote(@micropost)
    elsif artist_signed_in?
      current_artist.artist_micropost_unvote(@micropost)
    elsif record_label_signed_in?
      current_record_label.artist_micropost_unvote(@micropost)
    elsif venue_signed_in?
      current_venue.artist_micropost_unvote(@micropost)
    elsif producer_signed_in?
      current_producer.artist_micropost_unvote(@micropost)
    end
    respond_to do |format|
        format.html { redirect_to (:back) }
        format.js { render :action => "micropost_votes" }
      end
  end

  private

    def create_notification(artist_micropost, artist_micropost_vote)
      if artist_signed_in?
        return if artist_micropost.artist_id == current_artist.id
        ArtistNotification.create(artist_id: artist_micropost.artist_id,
          notifier_artist_id: current_artist.id,
          artist_micropost_id: artist_micropost.id,
          artist_micropost_vote_id: artist_micropost_vote.id,
          notice_type: 'vote')
      elsif fan_signed_in?
        ArtistNotification.create(artist_id: artist_micropost.artist_id,
          notifier_fan_id: current_fan.id,
          artist_micropost_id: artist_micropost.id,
          artist_micropost_vote_id: artist_micropost_vote.id,
          notice_type: 'vote')
      elsif record_label_signed_in?
        ArtistNotification.create(artist_id: artist_micropost.artist_id,
          notifier_record_label_id: current_record_label.id,
          artist_micropost_id: artist_micropost.id,
          artist_micropost_vote_id: artist_micropost_vote.id,
          notice_type: 'vote')
      elsif venue_signed_in?
        ArtistNotification.create(artist_id: artist_micropost.artist_id,
          notifier_venue_id: current_venue.id,
          artist_micropost_id: artist_micropost.id,
          artist_micropost_vote_id: artist_micropost_vote.id,
          notice_type: 'vote')
      elsif producer_signed_in?
        ArtistNotification.create(artist_id: artist_micropost.artist_id,
          notifier_producer_id: current_producer.id,
          artist_micropost_id: artist_micropost.id,
          artist_micropost_vote_id: artist_micropost_vote.id,
          notice_type: 'vote')
      end
    end

    def authenticate_voter
      (authenticate_fan! unless artist_signed_in? || record_label_signed_in? || venue_signed_in? || producer_signed_in?)
      (authenticate_artist! unless fan_signed_in? || record_label_signed_in? || venue_signed_in? || producer_signed_in?)
      (authenticate_record_label! unless artist_signed_in? || fan_signed_in? || venue_signed_in? || producer_signed_in?)
      (authenticate_venue! unless artist_signed_in? || fan_signed_in? || record_label_signed_in? || producer_signed_in?)
      (authenticate_producer! unless artist_signed_in? || fan_signed_in? || record_label_signed_in? || venue_signed_in?)
    end

end
