class Producers::VideosController < ApplicationController

  before_action :authenticate_producer!, except: [:index, :show]
  before_action :correct_producer, except: [:index, :show, :edit, :update, :destroy]
  before_action :set_producer, except: [:index, :show]
  before_action :correct_video_producer, only: [:edit, :update, :destroy]

  def index
    @producer = Producer.friendly.find(params[:producer_id])
    @videos = @producer.producer_videos.page params[:page]
  end

  def show
    @producer = Producer.friendly.find(params[:producer_id])
    @video = ProducerVideo.friendly.find(params[:id])
  end

  def new
    @video = ProducerVideo.new
  end

  def create
    @video = @producer.producer_videos.build(video_params)
    if @video.save
      redirect_to producer_videos_path(@producer)
      flash[:notice] = "you've successfully added a video!"
    else
      render 'new'
      flash.now[:alert] = "you've failed!"
    end
  end

  def edit
    @video = ProducerVideo.friendly.find(params[:id])
  end

  def update
    @video = ProducerVideo.friendly.find(params[:id])
    if @video.update_attributes(video_params)
      redirect_to producer_video_path(@producer, @video)
      flash[:notice] = "you've successfully updated your video!"
    else
      render 'edit'
      flash.now[:alert] = "you've failed!"
    end
  end

  def destroy
    @video = ProducerVideo.friendly.find(params[:id])
    @video.destroy
    redirect_to producer_videos_path(@producer)
  end

  private

    def set_producer
      @producer = current_producer
    end

    def correct_producer
      @producer = current_producer
      redirect_to producer_path(Producer.friendly.find(params[:producer_id])) if @producer != Producer.friendly.find(params[:producer_id])
    end

    def correct_video_producer
      @video = ProducerVideo.friendly.find(params[:id])
      redirect_to producer_path(@video.producer_id) if @video.producer_id != current_producer.id
    end

    def video_params
      params.require(:producer_video).permit(:producer_id, :title, :description, :youtube_url, :slug)
    end

end
