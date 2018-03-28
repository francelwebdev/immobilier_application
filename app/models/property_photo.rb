class PropertyPhoto < ApplicationRecord    
    belongs_to :property

    mount_uploader :photo, PropertyPhotoUploader
end
