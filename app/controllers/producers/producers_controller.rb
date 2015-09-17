class Producers::ProducersController < ApplicationController

  def index
    if params[:search]
      @producers = Producer.search(params[:search]).order("created_at DESC")
    else
      @producers = Producer.all
    end
  end

  def show
    @producer = Producer.friendly.find(params[:id])
  end

  def followers
    @producer = Producer.friendly.find(params[:producer_id])
  end

end

