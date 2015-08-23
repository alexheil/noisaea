class Recordlabels::RecordlabelsController < ApplicationController

  def index
    @record_labels = RecordLabel.all
  end

  def show
    @record_label = RecordLabel.friendly.find(params[:id])
  end

  def followers
    @record_label = RecordLabel.friendly.find(params[:record_label_id])
  end

end
