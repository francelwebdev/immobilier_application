class PropertyPhoto < ApplicationRecord    
    belongs_to :property

    mount_uploader :names, PropertyPhotoUploader
end
