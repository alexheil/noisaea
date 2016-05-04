class Artists::TracksController < ApplicationController

  before_action :authenticate_artist!, except: :show
  before_action :correct_artist, except: [:show, :edit, :update, :destroy]
  before_action :set_artist, except: :show
  before_action :correct_track_artist, only: [:edit, :update, :destroy]
  before_action :set_s3_direct_post, only: [:new, :edit, :create, :update]

  def show
    @artist = Artist.friendly.find(params[:artist_id])
    @album = ArtistAlbum.friendly.find(params[:album_id])
    @track = ArtistTrack.friendly.find(params[:id])
  end

  def new
    @album = ArtistAlbum.friendly.find(params[:album_id])
    @track = ArtistTrack.new
  end

  def create
    @album = ArtistAlbum.friendly.find(params[:album_id])
    @track = @album.artist_tracks.build(track_params)
    @track.artist_id = @album.artist_id
    if @track.save
      redirect_to artist_album_path(@artist, @album)
      flash[:notice] = "you've successfully added a track!"
    else
      render 'new'
      flash.now[:alert] = "you've failed!"
    end
  end

  def edit
    @album = ArtistAlbum.friendly.find(params[:album_id])
    @track = ArtistTrack.friendly.find(params[:id])
  end

  def update
    @album = ArtistAlbum.friendly.find(params[:album_id])
    @track = ArtistTrack.friendly.find(params[:id])
    if @track.update_attributes(track_params)
      redirect_to artist_album_path(@artist, @album)
      flash[:notice] = "you've successfully updated your track!"
    else
      render 'edit'
      flash.now[:alert] = "you've failed!"
    end
  end

  def destroy
    @album = ArtistAlbum.friendly.find(params[:album_id])
    @track = ArtistTrack.friendly.find(params[:id])
    @track.destroy
    redirect_to artist_album_path(@artist, @album)
  end

  private

    def set_artist
      @artist = current_artist
    end

    def correct_artist
      artist = current_artist
      redirect_to artist_path(Artist.friendly.find(params[:artist_id])) if artist != Artist.friendly.find(params[:artist_id])
    end

    def correct_track_artist
      @track = ArtistTrack.friendly.find(params[:id])
      redirect_to artist_path(@track.artist_id) if @track.artist_id != current_artist.id
    end

    def set_s3_direct_post
      artist = current_artist
      album = ArtistAlbum.friendly.find(params[:album_id])
      #@s3_direct_post = S3_BUCKET.presigned_post(key: "artists/00#{artist.id}/artist_albums/00#{album.id}/artist_tracks/#{SecureRandom.uuid}/${filename}", success_action_status: '201', acl: 'public-read')
    end

    def track_params
      params.require(:artist_track).permit(:artist_id, :artist_album_id, :title, :number, :price, :currency, :track_url, :lyrics, :slug)
    end

end
