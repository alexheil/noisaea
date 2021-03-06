class Producers::MicropostsController < ApplicationController

  before_action :authenticate_producer!, except: :show
  before_action :set_producer
  before_action :correct_producer, only: :create
  before_action :correct_micropost_producer, only: :destroy

  def create
    @micropost = @producer.producer_microposts.build(micropost_params)
    @producer = Producer.friendly.find(params[:producer_id])
    @microposts = @producer.producer_microposts.page params[:page]
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
    @micropost = ProducerMicropost.find(params[:id])
    @producer = Producer.friendly.find(params[:producer_id])
  end

  def destroy
    ProducerMicropost.find(params[:id]).destroy
    @producer = Producer.friendly.find(params[:producer_id])
    @microposts = @producer.producer_microposts.page params[:page]
    flash.now[:notice] = "you successfully deleted your status."
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
      params.require(:producer_micropost).permit(:content, :link_url, :photo_url)
    end

end
