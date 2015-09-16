class Producers::MicropostsController < ApplicationController

  before_action :authenticate_producer!, except: :show
  before_action :set_producer
  before_action :correct_producer, only: :create
  before_action :correct_micropost_producer, only: :destroy

  def create
    @micropost = ProducerMicropost.new(micropost_params)
    @micropost.producer_id = current_producer.id
    @producer = Producer.friendly.find(params[:producer_id])
    if @micropost.save
      respond_to do |format|
        format.html { redirect_to (:back) }
        format.js { render :action => "microposts" }
      end
    else
      redirect_to (:back)
      flash[:alert] = "You probably forgot to write something? Yeah, that's it!"
    end
  end

  def show
    @micropost = ProducerMicropost.find(params[:id])
    @producer = Producer.friendly.find(params[:producer_id])
  end

  def destroy
    ProducerMicropost.find(params[:id]).destroy
    @producer = Producer.friendly.find(params[:producer_id])
    respond_to do |format|
      format.html { redirect_to (:back) }
      format.js { render :action => "microposts" }
    end
  end

  private

    def set_producer
      @producer = current_producer
    end

    def correct_producer
      @producer = current_producer
      redirect_to producer_path(producer.friendly.find(params[:producer_id])) if @producer != Producer.friendly.find(params[:producer_id])
    end

    def correct_micropost_producer
      @micropost = ProducerMicropost.find(params[:id])
      redirect_to producer_path(@micropost.producer_id) if @micropost.producer_id != current_producer.id
    end

    def micropost_params
      params.require(:producer_micropost).permit(:producer_id, :content)
    end

end
