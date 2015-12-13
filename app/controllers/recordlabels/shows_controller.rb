class Recordlabels::ShowsController < ApplicationController

  before_action :authenticate_record_label!, except: [:index, :show]
  before_action :correct_record_label, except: [:index, :show, :edit, :update, :destroy]
  before_action :set_record_label, except: [:index, :show]
  before_action :correct_show_record_label, only: [:edit, :update, :destroy]

  def index
    @record_label = RecordLabel.friendly.find(params[:record_label_id])
  end

  def show
    @record_label = RecordLabel.friendly.find(params[:record_label_id])
    @show = RecordLabelShow.find(params[:id])
  end

  def new
    @show = RecordLabelShow.new
  end

  def create
    @show = @record_label.record_label_shows.build(show_params)
    if @show.save
      redirect_to record_label_shows_path(@record_label)
      flash[:notice] = "you've successfully added a show!"
    else
      render 'new'
      flash.now[:alert] = "you've failed!"
    end
  end

  def edit
    @show = RecordLabelShow.find(params[:id])
  end

  def update
    @show = RecordLabelShow.find(params[:id])
    if @show.update_attributes(show_params)
      redirect_to record_label_show_path(@record_label, @show)
      flash[:notice] = "you've successfully updated your show!"
    else
      render 'edit'
      flash.now[:alert] = "you've failed!"
    end
  end

  def destroy
    @show = RecordLabelShow.find(params[:id])
    @show.destroy
    redirect_to record_label_shows_path(@record_label)
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
      @show = RecordLabelShow.find(params[:id])
      redirect_to record_label_path(@show.record_label_id) if @show.record_label_id != current_record_label.id
    end

    def show_params
      params.require(:record_label_show).permit(:record_label_id, :artist, :month, :day, :year, :location, :venue, :description, :ticket_url, :flyer_url)
    end

end
