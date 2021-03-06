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
      @record_label = RecordLabel.friendly.find(params[:record_label_id])
      if current_record_label != @record_label
        redirect_to record_label_path(@record_label)
        flash[:alert] = "this is not your profile."
      end
    end

    def profile_params
      params.require(:record_label_profile).permit(:biography, :location, :genre, :artists, :founded, :website, :facebook_url, :twitter_url, :youtube_url, :itunes_url, :amazon_url, :google_play_url, :ticketfly_url, :letlyrics_url, :theme_color, :cover_image, :profile_image, :cover_img, :profile_img, :cover_img, :profile_img)
    end

end
