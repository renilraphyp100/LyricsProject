class Song < ActiveRecord::Base
  belongs_to :user
  belongs_to :album
  belongs_to :artist
  has_many :comments, as: :commentable

  validates :title, presence: true, length: { minimum: 5 }
  validates :lyrics, presence: true
  validates :album_id, presence: true
  validates :artist_id, presence: true

  ratyrate_rateable "quality"

end
