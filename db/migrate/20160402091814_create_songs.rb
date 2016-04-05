class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :title, null: false
      t.text :lyrics, null: false
      t.string :youtube_url
      t.references :album, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
