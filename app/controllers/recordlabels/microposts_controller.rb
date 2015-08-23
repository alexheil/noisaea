class Recordlabels::MicropostsController < ApplicationController

  before_action :authenticate_record_label!, except: :show
  before_action :set_record_label
  before_action :correct_record_label, only: :create
  before_action :correct_micropost_record_label, only: :destroy

  def create
    @micropost = RecordLabelMicropost.new(micropost_params)
    @micropost.record_label_id = current_record_label.id
    if @micropost.save
      flash[:notice] = "Thanks for translating your beautiful thoughts into words and posting them here!"
      redirect_to (:back)
    else
      flash[:alert] = "You probably forgot to write something? Yeah, that's it!"
      redirect_to (:back)
    end
  end

  def show
    @micropost = RecordLabelMicropost.find(params[:id])
    @record_label = RecordLabel.friendly.find(params[:record_label_id])
  end

  def destroy
    RecordLabelMicropost.find(params[:id]).destroy
    redirect_to (:back)
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
      params.require(:record_label_micropost).permit(:record_label_id, :content)
    end

end
