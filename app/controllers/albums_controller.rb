class AlbumsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @albums = Album.all
  end
  
  def new
    @album = current_user.albums.new
  end
  
  def create
    @album = current_user.albums.new(album_params)
 
    if @album.save
      redirect_to @album
    else
      render 'new'
    end

  end
  
  def show
    @album = Album.find(params[:id])
  end
  
  def edit
    @album = Album.find(params[:id])
    if @album.user != current_user
      redirect_to @album
    end
  end
  
  def update
    @album = Album.find(params[:id])
    if @album.user != current_user
      redirect_to @album
    end
   
    if @album.update(album_params)
      redirect_to @album
    else
      render 'edit'
    end
  end
  
  private
    def album_params
      params.require(:album).permit(:name, :description)
    end
  
  
    
end
