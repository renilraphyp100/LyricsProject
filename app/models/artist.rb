class Artist < ActiveRecord::Base
    has_many :albums, dependent: :destroy
    
    validates :name, presence: true, length: { minimum: 5 }
    validates :description, presence: true
end
