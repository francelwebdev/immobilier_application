class Dashboard::PropertiesController < ApplicationController
  def index
    @my_ads = current_user.properties.all.order("created_at DESC")
  end
end
