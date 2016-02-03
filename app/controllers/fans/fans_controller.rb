class Fans::FansController < ApplicationController

  def index
    @fans = Fan.all
  end

  def show
    @fan = Fan.friendly.find(params[:id])
  end

  def following
    @fan = Fan.friendly.find(params[:fan_id])
  end

  def music
    @fan = Fan.friendly.find(params[:fan_id])
  end

  def shows
    @fan = Fan.friendly.find(params[:fan_id])
  end

  def videos
    @fan = Fan.friendly.find(params[:fan_id])
  end

  def merch
    @fan = Fan.friendly.find(params[:fan_id])
  end

end
