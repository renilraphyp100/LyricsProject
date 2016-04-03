class Song < ActiveRecord::Base
  belongs_to :user
  has_many :comments, as: :commentable
  
  validates :title, presence: true, length: { minimum: 5 }
  validates :lyrics, presence: true
  validates :album_id, presence: true
  validates :artist_id, presence: true
end
