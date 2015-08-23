class Venues::MicropostsController < ApplicationController

  before_action :authenticate_venue!, except: :show
  before_action :set_venue
  before_action :correct_venue, only: :create
  before_action :correct_micropost_venue, only: :destroy

  def create
    @micropost = VenueMicropost.new(micropost_params)
    @micropost.venue_id = current_venue.id
    if @micropost.save
      flash[:notice] = "Thanks for translating your beautiful thoughts into words and posting them here!"
      redirect_to (:back)
    else
      flash[:alert] = "You probably forgot to write something? Yeah, that's it!"
      redirect_to (:back)
    end
  end

  def show
    @micropost = VenueMicropost.find(params[:id])
    @venue = Venue.friendly.find(params[:venue_id])
  end

  def destroy
    VenueMicropost.find(params[:id]).destroy
    redirect_to (:back)
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
      params.require(:venue_micropost).permit(:venue_id, :content)
    end

end
