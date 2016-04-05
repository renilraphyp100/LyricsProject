class Artist < ActiveRecord::Base
  has_many :songs
  has_many :albums, dependent: :destroy

  validates :name, presence: true, length: { minimum: 5 }
  validates :description, presence: true, length: { minimum: 15 }
end
