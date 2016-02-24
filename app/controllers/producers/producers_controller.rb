class Producers::ProducersController < ApplicationController

  def index
    if params[:search]
      @producers = Producer.search(params[:search]).order("created_at DESC")
    else
      @producers = Producer.all.page params[:page]
    end
  end

  def show
    @producer = Producer.friendly.find(params[:id])
    @microposts = @producer.producer_microposts.page params[:page]
  end

  def followers
    @producer = Producer.friendly.find(params[:producer_id])
    @followers = @producer.fans.page params[:page]
  end

end

