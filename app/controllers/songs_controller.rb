class SongsController < ApplicationController

  before_action :authenticate_user!
  
  def index
    @songs = Song.all
  end
  
  def new
    @song = current_user.songs.new
  end
  
  def create
    @song = current_user.songs.new(song_params)
 
    if @song.save
      redirect_to @song
    else
      render 'new'
    end

  end
  
  def show
    @song = Song.find(params[:id])
  end
  
  def edit
    @song = Song.find(params[:id])
    if @song.user != current_user
      redirect_to @song
    end
  end
  
  def update
    @song = Song.find(params[:id])
    if @song.user != current_user
      redirect_to @song
    end
   
    if @song.update(song_params)
      redirect_to @song
    else
      render 'edit'
    end
  end
  
  private
    def song_params
      params.require(:song).permit(:title, :lyrics, :youtube_url)
    end

end
