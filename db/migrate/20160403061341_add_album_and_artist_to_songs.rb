class AddAlbumAndArtistToSongs < ActiveRecord::Migration
  def change
    add_reference :songs, :album, index: true
    add_reference :songs, :artist, index: true
  end
end
