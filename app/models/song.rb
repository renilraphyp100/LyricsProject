class Song < ActiveRecord::Base
  belongs_to :user
  has_many :comments, as: :commentable
  
  validates :title, presence: true, length: { minimum: 5 }
  validates :lyrics, presence: true
end
