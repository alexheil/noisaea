class Producers::ProducersController < ApplicationController
  def index
    @producers = Producer.all
  end

  def show
    @producer = Producer.friendly.find(params[:id])
  end

  def followers
    @producer = Producer.friendly.find(params[:producer_id])
  end

end

