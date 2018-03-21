class PropertiesController < ApplicationController
  before_action :set_property, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:property_type].present? and params[:ad_type].present? and params[:city].present?
      @properties = Property.where("property_type_id = ? and ad_type_id = ? and city LIKE lower(?) or city LIKE ?", params[:property_type].to_i, params[:ad_type].to_i, params[:city], params[:city]).order("created_at DESC").page(params[:page]).per(9)
      @total_properties = @properties.count
    else
      @properties = Property.all.order("created_at DESC").page(params[:page]).per(9)
      @total_properties = @properties.count
    end
  end

  def show
    @property_photos = @property.property_photos.all
  end

  def new
    @property = current_user.properties.build
    @property.property_photos.build
    @property.build_user
  end

  def edit
  end

  def create
    @property = current_user.properties.build(property_params)
    if @property.save
      if params[:property_photos][:photo].present?
        params[:property_photos][:photo].each do |photo|
          @property.property_photos.create!(photo: photo, property_id: @property.id)
       end
      end      
      @property.create_user!(phone_number: params[:property][:user_attributes][:phone_number])
      redirect_to @property, notice: 'Property was successfully created.'
    else
      render :new
    end
  end

  def update
    if @property.update(property_params)
      redirect_to @property, notice: 'Property was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @property.destroy
    redirect_to properties_url, notice: 'Property was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_property
      @property = Property.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def property_params
      params.require(:property).permit(:property_type_id, :ad_type_id, :title, :price, :area, :description, :address, :city, property_photos_attributes: [:id, :photo, :property_id], user_attributes: [:id, :phone_number])
    end
end
