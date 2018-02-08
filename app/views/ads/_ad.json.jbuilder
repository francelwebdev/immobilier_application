json.extract! ad, :id, :title, :type_of_property_id, :price, :area, :image1_url, :image2_url, :image3_url, :description, :address, :city, :created_at, :updated_at
json.url ad_url(ad, format: :json)
