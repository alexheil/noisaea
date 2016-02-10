class Artists::CommentsController < ApplicationController

  before_action :authenticate_commenter, only: :create

  def create
    @comment = ArtistMicropostComment.new(comment_params)
    @comment.artist_micropost_id = ArtistMicropost.find(params[:micropost_id]).id
    @artist = Artist.friendly.find(ArtistMicropost.find(params[:micropost_id]).artist_id)
    @micropost = ArtistMicropost.find(params[:micropost_id])
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
      flash.now[:notice] = "you posted a comment on #{@artist.artist_name}'s status."
      create_notification(@micropost, @comment)
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
    ArtistMicropostComment.find(params[:id]).destroy
    @artist = Artist.friendly.find(ArtistMicropost.find(params[:micropost_id]).artist_id)
    @micropost = ArtistMicropost.find(params[:micropost_id])
    flash.now[:notice] = "you successfully deleted your comment."
    respond_to do |format|
      format.html { redirect_to (:back) }
      format.js { render :action => "comments" }
    end
  end

  private

    def send_comment_email
      return if @artist.id == current_artist.id
      ArtistMailer.comment_email(@artist, @micropost).deliver_now unless @artist.comment_email == false
    end

    def create_notification(artist_micropost, artist_micropost_comment)
      if artist_signed_in?
        return if artist_micropost.artist_id == current_artist.id
        ArtistNotification.create(artist_id: artist_micropost.artist_id,
          notifier_artist_id: current_artist.id,
          artist_micropost_id: artist_micropost.id,
          artist_micropost_comment_id: artist_micropost_comment.id,
          notice_type: 'comment')
      elsif fan_signed_in?
        ArtistNotification.create(artist_id: artist_micropost.artist_id,
          notifier_fan_id: current_fan.id,
          artist_micropost_id: artist_micropost.id,
          artist_micropost_comment_id: artist_micropost_comment.id,
          notice_type: 'comment')
      elsif record_label_signed_in?
        ArtistNotification.create(artist_id: artist_micropost.artist_id,
          notifier_record_label_id: current_record_label.id,
          artist_micropost_id: artist_micropost.id,
          artist_micropost_comment_id: artist_micropost_comment.id,
          notice_type: 'comment')
      elsif venue_signed_in?
        ArtistNotification.create(artist_id: artist_micropost.artist_id,
          notifier_venue_id: current_venue.id,
          artist_micropost_id: artist_micropost.id,
          artist_micropost_comment_id: artist_micropost_comment.id,
          notice_type: 'comment')
      elsif producer_signed_in?
        ArtistNotification.create(artist_id: artist_micropost.artist_id,
          notifier_producer_id: current_producer.id,
          artist_micropost_id: artist_micropost.id,
          artist_micropost_comment_id: artist_micropost_comment.id,
          notice_type: 'comment')
      end
    end

    def authenticate_commenter
      (authenticate_fan! unless artist_signed_in? || record_label_signed_in? || venue_signed_in? || producer_signed_in?)
      (authenticate_artist! unless fan_signed_in? || record_label_signed_in? || venue_signed_in? || producer_signed_in?)
      (authenticate_record_label! unless artist_signed_in? || fan_signed_in? || venue_signed_in? || producer_signed_in?)
      (authenticate_venue! unless artist_signed_in? || fan_signed_in? || record_label_signed_in? || producer_signed_in?)
      (authenticate_producer! unless artist_signed_in? || fan_signed_in? || record_label_signed_in? || venue_signed_in?)
    end

    def comment_params
      params.require(:artist_micropost_comment).permit(:content)
    end
end
