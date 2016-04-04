class Album < ActiveRecord::Base
    belongs_to :artist
    has_many :comments, as: :commentable
    
    
    validates :name, presence: true, length: { minimum: 5 }
    validates :description, presence: true
    mount_uploader :picture, PictureUploader
    validate :picture_size
    
    private
        def picture_size
            if picture.size > 5.megabytes
                errors.add(:picture, "Should be less than 5MB.")
            end
        end
end
