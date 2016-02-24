class Venues::MicropostsController < ApplicationController

  before_action :authenticate_venue!, except: :show
  before_action :set_venue
  before_action :correct_venue, only: :create
  before_action :correct_micropost_venue, only: :destroy

  def create
    @micropost = @venue.venue_microposts.build(micropost_params)
    @venue = Venue.friendly.find(params[:venue_id])
    @microposts = @venue.venue_microposts.page params[:page]
    if @micropost.save
      flash.now[:notice] = "your status has been posted!"
      respond_to do |format|
        format.html { redirect_to (:back) }
        format.js { render :action => "microposts" }
      end
    else
      redirect_to (:back)
      flash[:alert] = "you probably forgot to write something? yeah, that's it!"
    end
  end

  def show
    @micropost = VenueMicropost.find(params[:id])
    @venue = Venue.friendly.find(params[:venue_id])
  end

  def destroy
    VenueMicropost.find(params[:id]).destroy
    @venue = Venue.friendly.find(params[:venue_id])
    @microposts = @venue.venue_microposts.page params[:page]
    flas.now[:notice] = "you successfully deleted your status."
    respond_to do |format|
      format.html { redirect_to (:back) }
      format.js { render :action => "microposts" }
    end
  end

  private

    def set_venue
      @venue = current_venue
    end

    def correct_venue
      @venue = current_venue
      redirect_to venue_path(Venue.friendly.find(params[:venue_id])) if @venue != Venue.friendly.find(params[:venue_id])
    end

    def correct_micropost_venue
      @micropost = VenueMicropost.find(params[:id])
      redirect_to venue_path(@venue.venue_id) if @micropost.venue_id != current_venue.id
    end

    def micropost_params
      params.require(:venue_micropost).permit(:content, :link_url, :photo_url)
    end

end
