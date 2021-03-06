class Artists::NotificationsController < ApplicationController

  before_action :authenticate_artist!
  before_action :correct_artist
  before_action :set_artist

  def index
    @notifications = @artist.artist_notifications
  end

  def update
    @notification = ArtistNotification.find(params[:id])
    @notifications = @artist.artist_notifications
    if @notification.update_attributes(read: true)
      flash.now[:notice] = "marked read"
      respond_to do |format|
        format.html { redirect_to artist_notifications_path(current_artist) }
        format.js { render :action => "notifications" }
      end
    else
      redirect_to current_artist
      flash[:alert] = "not working"
    end
  end

  private

    def set_artist
      @artist = current_artist
    end

    def correct_artist
      @artist = Artist.friendly.find(params[:artist_id])
      unless current_artist == @artist
        redirect_to artist_path(@artist)
        flash.now[:alert] = "this is not your profile."
      end
    end

end
