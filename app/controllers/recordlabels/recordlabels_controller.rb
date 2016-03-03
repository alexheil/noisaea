class Recordlabels::RecordlabelsController < ApplicationController

  def index
    if params[:search]
      @record_labels = RecordLabel.search(params[:search]).order("created_at DESC").page params[:page]
    else
      @record_labels = RecordLabel.all.page params[:page]
    end
  end

  def show
    @record_label = RecordLabel.friendly.find(params[:id])
    @microposts = @record_label.record_label_microposts.page params[:page]
  end

  def followers
    @record_label = RecordLabel.friendly.find(params[:record_label_id])
    @followers = @record_label.fans.page params[:page]
  end

end
