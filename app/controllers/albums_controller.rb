class AlbumsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_album, only: [:show, :edit, :update]

  def index
    @albums = Album.all
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.new(album_params)

    if @album.save
      redirect_to @album
    else
      render 'new'
    end

  end

  def show
  end

  def edit
  end

  def update

    if @album.update(album_params)
      redirect_to @album
    else
      render 'edit'
    end
  end

  private

  def find_album
    @album = Album.find(params[:id])
  end

  def album_params
    params.require(:album).permit(:name, :description, :picture, :artist_id)
  end



end
