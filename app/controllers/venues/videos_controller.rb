class Venues::VideosController < ApplicationController

  before_action :authenticate_venue!, except: [:index, :show]
  before_action :correct_venue, except: [:index, :show, :edit, :update, :destroy]
  before_action :set_venue, except: [:index, :show]
  before_action :correct_video_venue, only: [:edit, :update, :destroy]

  def index
    @venue = Venue.friendly.find(params[:venue_id])
  end

  def show
    @venue = Venue.friendly.find(params[:venue_id])
    @video = VenueVideo.friendly.find(params[:id])
  end

  def new
    @video = VenueVideo.new
  end

  def create
    @video = @venue.venue_videos.build(video_params)
    if @video.save
      redirect_to venue_videos_path(@venue)
      flash[:notice] = "you've successfully added a video!"
    else
      render 'new'
      flash.now[:alert] = "you've failed!"
    end
  end

  def edit
    @video = VenueVideo.friendly.find(params[:id])
  end

  def update
    @video = VenueVideo.friendly.find(params[:id])
    if @video.update_attributes(video_params)
      redirect_to venue_video_path(@venue, @video)
      flash[:notice] = "you've successfully updated your video!"
    else
      render 'edit'
      flash.now[:alert] = "you've failed!"
    end
  end

  def destroy
    @video = VenueVideo.friendly.find(params[:id])
    @video.destroy
    redirect_to venue_videos_path(@venue)
  end

  private

    def set_venue
      @venue = current_venue
    end

    def correct_venue
      @venue = current_venue
      redirect_to venue_path(Venue.friendly.find(params[:venue_id])) if @venue != Venue.friendly.find(params[:venue_id])
    end

    def correct_video_venue
      @video = VenueVideo.friendly.find(params[:id])
      redirect_to venue_path(@video.venue_id) if @video.venue_id != current_venue.id
    end

    def video_params
      params.require(:venue_video).permit(:venue_id, :title, :description, :youtube_url, :slug)
    end

end
