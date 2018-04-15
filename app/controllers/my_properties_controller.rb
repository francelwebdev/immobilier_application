class MyPropertiesController < ApplicationController
  def index
      @my_properties = current_user.properties.all.order("created_at DESC")    
  end
end
