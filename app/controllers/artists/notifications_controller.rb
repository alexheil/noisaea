class Artists::NotificationsController < ApplicationController

  before_action :authenticate_artist!
  before_action :correct_artist
  before_action :set_artist

  def index
  end

  def update
    @notification = ArtistNotification.find(params[:id])
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

  def notification_cleanup
    ArtistNotification.where(read: true).where("updated_at > ?", 3.days.ago).find_each do |notification|
      notification.destroy
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
