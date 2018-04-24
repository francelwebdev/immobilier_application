class MyPropertiesController < ApplicationController
  def index
      @my_properties = current_user.properties.all.order("created_at DESC").published.page(params[:page]).per(9)
      @my_properties_numbers = @my_properties.count
  end

  def destroy
      @my_property = Property.find(params[:id])
      @my_property.delete
      redirect_to my_properties_path
  end
end
