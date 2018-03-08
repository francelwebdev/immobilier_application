class PropertyPhoto < ApplicationRecord    
    belongs_to :property

    validates :photo, presence: true

    mount_uploader :photo, PropertyPhotoUploader
end
