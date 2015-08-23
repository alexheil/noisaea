class Artists::MicropostsController < ApplicationController

  before_action :authenticate_artist!, except: :show
  before_action :set_artist
  before_action :correct_artist, only: :create
  before_action :correct_micropost_artist, only: :destroy

  def create
    @micropost = ArtistMicropost.new(micropost_params)
    @micropost.artist_id = current_artist.id
    if @micropost.save
      flash[:notice] = "Thanks for translating your beautiful thoughts into words and posting them here!"
      redirect_to (:back)
    else
      flash[:alert] = "You probably forgot to write something? Yeah, that's it!"
      redirect_to (:back)
    end
  end

  def show
    @micropost = ArtistMicropost.find(params[:id])
    @artist = Artist.friendly.find(params[:artist_id])
  end

  def destroy
    ArtistMicropost.find(params[:id]).destroy
    redirect_to (:back)
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
      params.require(:artist_micropost).permit(:artist_id, :content)
    end

end
