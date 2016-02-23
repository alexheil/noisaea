class Artists::MerchesController < ApplicationController

  before_action :authenticate_artist!, except: [:index, :show]
  before_action :correct_artist, except: [:index, :show, :edit, :update, :destroy]
  before_action :set_artist, except: [:index, :show]
  before_action :correct_merch_artist, only: [:edit, :update, :destroy]

  def index
    @artist = Artist.friendly.find(params[:artist_id])
    @merch = @artist.artist_merches.page params[:page]
  end

  def show
    @artist = Artist.friendly.find(params[:artist_id])
    @merch = ArtistMerch.friendly.find(params[:id])
  end

  def new
    @merch = ArtistMerch.new
  end

  def create
    @merch = @artist.artist_merches.build(merch_params)
    if @merch.save
      redirect_to artist_merches_path(@artist)
      flash[:notice] = "you've successfully added #{@merch.title}!"
    else
      render 'new'
      flash.now[:alert] = "you've failed!"
    end
  end

  def edit
    @merch = ArtistMerch.friendly.find(params[:id])
  end

  def update
    @merch = ArtistMerch.friendly.find(params[:id])
    if @merch.update_attributes(merch_params)
      redirect_to artist_merch_path(@artist, @merch)
      flash[:notice] = "you've successfully updated #{@merch.title}!"
    else
      render 'edit'
      flash.now[:alert] = "you've failed!"
    end
  end

  def destroy
    @merch = ArtistMerch.friendly.find(params[:id])
    @merch.destroy
    redirect_to artist_merches_path(@artist)
  end

  private

    def set_artist
      @artist = current_artist
    end

    def correct_artist
      @artist = current_artist
      redirect_to artist_path(Artist.friendly.find(params[:artist_id])) if @artist != Artist.friendly.find(params[:artist_id])
    end

    def correct_merch_artist
      @merch = ArtistMerch.friendly.find(params[:id])
      redirect_to artist_path(@merch.artist_id) if @merch.artist_id != current_artist.id
    end

    def merch_params
      params.require(:artist_merch).permit(:artist_id, :title, :description, :category, :base_price, :shipping_price, :currency, :total_price, :quantity, :options, :merch_url, :image_url, :item_img, :return_policy, :shipping_info, :slug)
    end

end
