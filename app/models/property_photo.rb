class PropertyPhoto < ApplicationRecord    
    belongs_to :property

    mount_uploaders :names, PropertyPhotoUploader
end
