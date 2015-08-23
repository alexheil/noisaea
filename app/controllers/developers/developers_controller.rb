class Developers::DevelopersController < ApplicationController

  before_action :authenticate_buffalo, except: [:index, :show]

  def index
    @developers = Developer.all
  end

  def show
    @developers = Developer.all
    @developer = Developer.friendly.find(params[:id])
  end

  def new
    @developer = Developer.new
  end

  def create
    @developer = Developer.new(developer_params)
    @developer.buffalo_id = current_buffalo.id
    if @developer.save
      flash[:notice] = "you just created " + @developer.title + "!"
      redirect_to developer_path(@developer)
    else
      flash.now[:alert] = 'you messed up, bruh.'
      render 'new'
    end
  end

  def edit
    @developer = Developer.friendly.find(params[:id])
  end

  def update
    @developer = Developer.friendly.find(params[:id])
    if @developer.update_attributes(developer_params)
      flash[:notice] = "good job"
      redirect_to developer_path(@developer)
    else
      flash.now[:alert] = 'bad job'
      render 'edit'
    end
  end

  def destroy
    @developer = Developer.friendly.find(params[:id]).destroy
    redirect_to developers_path
    flash[:notice] = "delete successful"
  end

  private

    def developer_params
      params.require(:developer).permit(:title, :content, :category, :slug, :image)
    end

    def authenticate_buffalo
      redirect_to root_url unless buffalo_signed_in?
    end

end
