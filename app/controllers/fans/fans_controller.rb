class Fans::FansController < ApplicationController

  def index
    @fans = Fan.all
  end

  def show
    @fan = Fan.friendly.find(params[:id])
    @artist_microposts = @fan.artist_microposts.page params[:page]
    @record_label_microposts = @fan.record_label_microposts
    @venue_microposts = @fan.venue_microposts
    @producer_microposts = @fan.producer_microposts
  end

  def following
    @fan = Fan.friendly.find(params[:fan_id])
    @artists = @fan.artists.page params[:page]
    @record_labels = @fan.record_labels
    @venues = @fan.venues
    @producers = @fan.producers
  end

  def music
    @fan = Fan.friendly.find(params[:fan_id])
    @artist_albums = @fan.artist_albums.page params[:page]
  end

  def shows
    @fan = Fan.friendly.find(params[:fan_id])
    @artist_shows = @fan.artist_shows.page params[:page]
    @record_label_shows = @fan.record_label_shows
    @venue_shows = @fan.venue_shows
  end

  def videos
    @fan = Fan.friendly.find(params[:fan_id])
    @artist_videos = @fan.artist_videos.page params[:page]
    @record_label_videos = @fan.record_label_videos
    @venue_videos = @fan.venue_videos
    @producer_videos = @fan.producer_videos
  end

  def merch
    @fan = Fan.friendly.find(params[:fan_id])
    @artist_merch = @fan.artist_merches.page params[:page]
  end

end
