class Recordlabels::VideosController < ApplicationController

  before_action :authenticate_record_label!, except: [:index, :show]
  before_action :correct_record_label, except: [:index, :show, :edit, :update, :destroy]
  before_action :set_record_label, except: [:index, :show]
  before_action :correct_show_record_label, only: [:edit, :update, :destroy]

  def index
    @record_label = RecordLabel.friendly.find(params[:record_label_id])
  end

  def show
    @record_label = RecordLabel.friendly.find(params[:record_label_id])
    @video = RecordLabelVideo.friendly.find(params[:id])
  end

  def new
    @video = RecordLabelVideo.new
  end

  def create
    @video = @record_label.record_label_videos.build(video_params)
    if @video.save
      redirect_to record_label_videos_path(@record_label)
      flash[:notice] = "you've successfully added a show!"
    else
      render 'new'
      flash.now[:alert] = "you've failed!"
    end
  end

  def edit
    @video = RecordLabelVideo.friendly.find(params[:id])
  end

  def update
    @video = RecordLabelVideo.friendly.find(params[:id])
    if @video.update_attributes(video_params)
      redirect_to record_label_show_path(@record_label, @show)
      flash[:notice] = "you've successfully updated your show!"
    else
      render 'edit'
      flash.now[:alert] = "you've failed!"
    end
  end

  def destroy
    @video = RecordLabelVideo.friendly.find(params[:id])
    @video.destroy
    redirect_to record_label_videos_path(@record_label)
  end

  private

    def set_record_label
      @record_label = current_record_label
    end

    def correct_record_label
      @record_label = current_record_label
      redirect_to record_label_path(RecordLabel.friendly.find(params[:record_label_id])) if @record_label != RecordLabel.friendly.find(params[:record_label_id])
    end

    def correct_show_record_label
      @video = RecordLabelVideo.friendly.find(params[:id])
      redirect_to record_label_path(@video.record_label_id) if @video.record_label_id != current_record_label.id
    end

    def video_params
      params.require(:record_label_video).permit(:record_label_id, :title, :youtube_url, :description, :slug)
    end

end
