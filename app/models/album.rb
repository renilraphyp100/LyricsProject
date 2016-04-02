class Album < ActiveRecord::Base
    belongs_to :user
    
    validates :name, presence: true, length: { minimum: 5 }
    validates :description, presence: true
end
