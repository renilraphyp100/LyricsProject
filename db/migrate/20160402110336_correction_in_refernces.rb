class CorrectionInRefernces < ActiveRecord::Migration
  def change
    remove_reference :albums, :user, index: true
    remove_reference :songs, :album, index: true
    add_reference :songs, :user, index: true
  end
end
