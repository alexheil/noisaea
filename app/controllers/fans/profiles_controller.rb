class Fans::ProfilesController < ApplicationController

  before_action :authenticate_fan!
  before_action :correct_fan
  before_action :set_fan

  def edit
    @profile = @fan.fan_profile
  end

  def update
    @profile = @fan.fan_profile
    if @profile.update_attributes(profile_params)
      flash[:notice] = "you've successfully updated your profile!"
      redirect_to current_fan
    else
      render 'edit'
      flash[:alert] = "you failed =/"
    end
  end

  private

    def set_fan
      @fan = current_fan
    end

    def correct_fan
      @fan = current_fan
      if @fan != Fan.friendly.find(params[:fan_id])
        redirect_to fan_path(Fan.friendly.find(params[:fan_id]))
        flash[:alert] = "this is not your profile."
      end
    end

    def profile_params
      params.require(:fan_profile).permit(:biography, :location, :website, :cover_image, :profile_image)
    end

end
