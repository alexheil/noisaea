class Recordlabels::RecordlabelsController < ApplicationController

  def index
    if params[:search]
      @record_labels = RecordLabel.search(params[:search]).order("created_at DESC")
    else
      @record_labels = RecordLabel.all
    end
  end

  def show
    @record_label = RecordLabel.friendly.find(params[:id])
  end

  def followers
    @record_label = RecordLabel.friendly.find(params[:record_label_id])
  end

end
