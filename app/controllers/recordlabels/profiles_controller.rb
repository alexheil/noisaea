class Recordlabels::ProfilesController < ApplicationController

  before_action :authenticate_record_label!
  before_action :correct_record_label
  before_action :set_record_label

  def edit
    @profile = @record_label.record_label_profile
  end

  def update
    @profile = @record_label.record_label_profile
    if @profile.update_attributes(profile_params)
      flash[:notice] = "you've successfully updated your profile!"
      redirect_to current_record_label
    else
      render 'edit'
      flash[:alert] = "you failed =/"
    end
  end

  private

    def set_record_label
      @record_label = current_record_label
    end

    def correct_record_label
      @record_label = current_record_label
      redirect_to record_label_path(RecordLabel.friendly.find(params[:record_label_id])) if @record_label != RecordLabel.friendly.find(params[:record_label_id])
      flash[:alert] = "this is not your profile."
    end

    def profile_params
      params.require(:record_label_profile).permit(:biography, :location, :genre, :artists, :founded, :facebook_url, :twitter_url, :youtube_url, :itunes_url, :amazon_url, :google_play_url, :cover_image, :profile_image)
    end

end
