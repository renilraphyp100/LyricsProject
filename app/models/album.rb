class Album < ActiveRecord::Base
    has_many :comments, as: :commentable
    
    validates :name, presence: true, length: { minimum: 5 }
    validates :description, presence: true
end
