class Artists::MicropostsController < ApplicationController

  before_action :authenticate_artist!, except: :show
  before_action :set_artist, except: [:show]
  before_action :correct_artist, only: :create
  before_action :correct_micropost_artist, only: :destroy

  def create
    @micropost = @artist.artist_microposts.build(micropost_params)
    @artist = Artist.friendly.find(params[:artist_id])
    @microposts = @artist.artist_microposts.page params[:page]
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
    @micropost = ArtistMicropost.find(params[:id])
    @artist = Artist.friendly.find(params[:artist_id])
  end

  def destroy
    ArtistMicropost.find(params[:id]).destroy
    @artist = Artist.friendly.find(params[:artist_id])
    flash.now[:notice] = "you successfully deleted your status."
    respond_to do |format|
      format.html { redirect_to (:back) }
      format.js { render :action => "microposts" }
    end
  end

  private

    def set_artist
      @artist = current_artist
    end

    def correct_artist
      @artist = current_artist
      redirect_to artist_path(Artist.friendly.find(params[:artist_id])) if @artist != Artist.friendly.find(params[:artist_id])
    end

    def correct_micropost_artist
      @micropost = ArtistMicropost.find(params[:id])
      redirect_to artist_path(@micropost.artist_id) if @micropost.artist_id != current_artist.id
    end

    def micropost_params
      params.require(:artist_micropost).permit(:content, :link_url, :photo_url)
    end

end
