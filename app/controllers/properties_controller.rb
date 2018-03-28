class PropertiesController < ApplicationController
    before_action :set_property, only: [:show, :edit, :update, :destroy]
    skip_before_action :authenticate_user!, only: [:index, :show]

    def index
        if params[:ad_type].present?
            @ad_type_id = AdType.find_by(title: params[:ad_type]).id
            @properties = Property.where("ad_type_id = ?", @ad_type_id).all.order("created_at DESC").page(params[:page]).per(9)
        elsif  params[:property_type].present? and params[:ad_type].present? and params[:city].present?
            @properties = Property.where("property_type_id = ? and ad_type_id = ? and (lower(city) LIKE ? or upper(city) LIKE ?)", params[:property_type].to_i, params[:ad_type].to_i, "%#{params[:city]}%", "%#{params[:city]}%").all.order("created_at DESC").page(params[:page]).per(9)
        else
            @properties = Property.all.order("created_at DESC").page(params[:page]).per(9)
        end
    end

    def show
        @property_photos = @property.property_photos.all
    end

    def new
        @property = current_user.properties.build
        @property_photos = @property.property_photos.build
        @user = @property.build_user
        @rooms = Property::ROOM
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
        params.require(:property).permit(:property_type_id, :ad_type_id, :title, :price, :room, :area, :description, :address, :city, property_photos_attributes: [:photo])
    end
end
