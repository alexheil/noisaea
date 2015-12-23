class Recordlabels::MicropostsController < ApplicationController

  before_action :authenticate_record_label!, except: :show
  before_action :set_record_label
  before_action :correct_record_label, only: :create
  before_action :correct_micropost_record_label, only: :destroy

  def create
    @micropost = @record_label.record_label_microposts.build(micropost_params)
    @record_label = RecordLabel.friendly.find(params[:record_label_id])
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
    @micropost = RecordLabelMicropost.find(params[:id])
    @record_label = RecordLabel.friendly.find(params[:record_label_id])
  end

  def destroy
    RecordLabelMicropost.find(params[:id]).destroy
    @record_label = RecordLabel.friendly.find(params[:record_label_id])
    flash.now[:notice] = "you successfully deleted your status."
    respond_to do |format|
      format.html { redirect_to (:back) }
      format.js { render :action => "microposts" }
    end
  end

  private

    def set_record_label
      @record_label = current_record_label
    end

    def correct_record_label
      @record_label = current_record_label
      redirect_to record_label_path(RecordLabel.friendly.find(params[:record_label_id])) if @record_label != RecordLabel.friendly.find(params[:record_label_id])
    end

    def correct_micropost_record_label
      @micropost = RecordLabelMicropost.find(params[:id])
      redirect_to record_label_path(@record_label.record_label_id) if @micropost.record_label_id != current_record_label.id
    end

    def micropost_params
      params.require(:record_label_micropost).permit(:content, :link_url, :photo_url)
    end

end
