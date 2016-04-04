class SongsController < ApplicationController

  before_action :authenticate_user!
  
  def index
    if params['sort_by'] == "title"
      @songs = Song.order(:title).paginate(:page => params[:page], :per_page => 2)
    else
      @songs = Song.order(updated_at: :desc).paginate(:page => params[:page], :per_page => 2)
    end
  end
  
  def new
    @song = current_user.songs.new
    @artists = Artist.all
    @albums = nil
  end
  
  def create
    @song = current_user.songs.new(song_params)
    
    @artists = Artist.all
    @albums = Album.where(artist_id: params[:song][:artist_id]) if params[:song][:artist_id] != nil

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
    
    @artists = Artist.all
    @albums = Album.where(artist_id: @song.artist_id) if @song.artist_id != nil
    
    if @song.user != current_user
      redirect_to @song
    end
  end
  
  def update
    @song = Song.find(params[:id])
    
    @artists = Artist.all
    @albums = Album.where(artist_id: params[:song][:artist_id]) if params[:song][:artist_id] != nil
    
    if @song.user != current_user
      redirect_to @song
    end
   
    if @song.update(song_params)
      redirect_to @song
    else
      render 'edit'
    end
  end
  
  def get_albums_of_artist
    @artist = Artist.find(params[:artist_id])
    @albums = @artist.albums
    
    result_str = '<option value="">Please select your album</option>'
        
    @albums.each do |album|
      result_str = result_str + "<option value='#{album.id}'>#{album.name}</option>"
    end
    
    
    render :json => {"result": result_str}
  end
  
  private
    def song_params
      params.require(:song).permit(:title, :lyrics, :youtube_url, :album_id, :artist_id)
    end

end
