class Dashboard::PropertiesController < ApplicationController
	before_action :set_property, only: [:show, :edit, :update, :destroy]

  def index
    @my_ads = current_user.properties.all.order("created_at DESC")
    @my_ads_total = @my_ads.count

    # <%= link_to 'Destroy', property, method: :delete, data: { confirm: 'Are you sure?' } %>
  end

  def show

  end

  def edit
  	
  end

  def update
  	
  end

  def destroy
  	
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_property
      @property = Property.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def property_params
      params.require(:property).permit(:property_type_id, :ad_type_id, :title, :price, :area, :description, :address, :city, user_attributes: [:phone_number], property_photos_attributes: [:photo])
    end

end
