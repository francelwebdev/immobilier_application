class PropertiesController < ApplicationController
    skip_before_action :authenticate_user!, only: [:index, :show, :search]
    before_action :set_property, only: [:show, :edit, :update, :destroy]

    def publish
        @property_to_publish = Property.find(params[:id])
        @property_to_publish.update published: true, published_at: Date.today, expire_at: Date.today + 1.week
        redirect_to @property_to_publish, notice: 'Annonce mise en ligne, OK'
    end

    def deactivate
        @property_to_deactivate = Property.find(params[:id])
        @property_to_deactivate.update published: false
        redirect_to @property_to_deactivate, notice: 'Annonce désactiver, OK'
    end

    def search
        if params.has_key?(:property_type) && params.has_key?(:ad_type) && params.has_key?(:city) && !params.has_key?(:room) && !params.has_key?(:price) && !params.has_key?(:area)
            property_type_id = PropertyType.find_by(name: params[:property_type]).id
            ad_type_id = AdType.find_by(name: params[:ad_type]).id
            city = City.find_by(name: params[:city].capitalize)
            if city.nil?
                @properties = Property.includes(:user, :property_type, :ad_type, :city).where("property_type_id = :property_type_id and ad_type_id = :ad_type_id", property_type_id: property_type_id, ad_type_id: ad_type_id).published.all.order("created_at DESC").paginate(page: params[:page], per_page: 6)
                @properties_numbers = @properties.count
            else
                property_type_id = PropertyType.find_by(name: params[:property_type]).id
                ad_type_id = AdType.find_by(name: params[:ad_type]).id
                city_id = City.find_by(name: params[:city].capitalize).id
                @properties = Property.includes(:user, :property_type, :ad_type, :city, :room).where("property_type_id = :property_type_id and ad_type_id = :ad_type_id and city_id = :city_id", property_type_id: property_type_id, ad_type_id: ad_type_id, city_id: city_id).published.all.order("created_at DESC").paginate(page: params[:page], per_page: 6)
                @properties_numbers = @properties.count
            end
        elsif params.has_key?(:property_type) and params.has_key?(:ad_type) and params.has_key?(:city) and params.has_key?(:room) and params.has_key?(:price) and params.has_key?(:area)
            property_type_id = PropertyType.find_by(name: params[:property_type]).id
            ad_type_id = AdType.find_by(name: params[:ad_type]).id
            city = City.find_by(name: params[:city].capitalize)
            room_id = Room.find_by(name: params[:room]).id
            if city.nil?
                @properties = Property.includes(:user, :property_type, :ad_type, :city, :room).where("property_type_id = :property_type_id and ad_type_id = :ad_type_id and room_id = :room_id and price <= :price and area >= :area or description LIKE :description or title LIKE :title or address LIKE :address", property_type_id: property_type_id, ad_type_id: ad_type_id, room_id: room_id, price: params[:price].to_i, area: params[:area].to_i, description: "%#{params[:city].downcase}%", title: "%#{params[:city].downcase}%", address: "%#{params[:city].downcase}%").published.all.order("created_at DESC").paginate(page: params[:page], per_page: 6)
                @properties_numbers = @properties.count
            else
                property_type_id = PropertyType.find_by(name: params[:property_type]).id
                ad_type_id = AdType.find_by(name: params[:ad_type]).id
                city_id = City.find_by(name: params[:city].capitalize).id
                room_id = Room.find_by(name: params[:room]).id
                @properties = Property.includes(:user, :property_type, :ad_type, :city, :room).where("property_type_id = :property_type_id and ad_type_id = :ad_type_id and city_id = :city_id and room_id = :room_id and price <= :price and area >= :area", property_type_id: property_type_id, ad_type_id: ad_type_id, city_id: city_id, room_id: room_id, price: params[:price].to_i, area: params[:area].to_i).published.all.order("created_at DESC").paginate(page: params[:page], per_page: 6)
                @properties_numbers = @properties.count
            end
        elsif params.has_key?(:property_type) and !params.has_key?(:ad_type) and !params.has_key?(:city) and !params.has_key?(:room) and !params.has_key?(:price) and !params.has_key?(:area)
            property_type_id = PropertyType.find_by(name: params[:property_type]).id
            @properties = Property.includes(:user, :property_type, :ad_type, :city, :room).where("property_type_id = :property_type_id", property_type_id: property_type_id).published.all.order("created_at DESC").paginate(page: params[:page], per_page: 6)
            @properties_numbers = @properties.count
        elsif !params.has_key?(:property_type) and params.has_key?(:ad_type) and !params.has_key?(:city) and !params.has_key?(:room) and !params.has_key?(:price) and !params.has_key?(:area)
            ad_type_id = AdType.find_by(name: params[:ad_type]).id
            @properties = Property.includes(:user, :property_type, :ad_type, :city, :room).where("ad_type_id = :ad_type_id", ad_type_id: ad_type_id).published.all.order("created_at DESC").paginate(page: params[:page], per_page: 6)
            @properties_numbers = @properties.count
        else
            @properties = Property.includes(:user, :property_type, :ad_type, :city, :room).all.order("created_at DESC").published.paginate(page: params[:page], per_page: 6)
            @properties_numbers = @properties.count
        end
    end

    def index
        @properties = Property.includes(:user, :property_type, :ad_type, :city).all.order("created_at DESC").published.paginate(page: params[:page], per_page: 6)
        @properties_numbers = @properties.count
    end

    def show
        @owner = @property.user
        @message = @owner.messages.build
    end

    def new
        @property = current_user.properties.build
    end

    def edit

    end

    def create
        @property = current_user.properties.build(property_params)
        if @property.save
            if params[:property][:user].present?
                user = User.find(@property.user.id)
                user.update first_name: params[:property][:user][:first_name], last_name: params[:property][:user][:last_name], phone_number: params[:property][:user][:phone_number]
            end
            redirect_to @property, notice: "Le bien a été ajouté avec succès."
            # , en attente de mise en ligne par un administrateur
        else
            render :new
        end
    end

    def update
        if @property.update(property_params)
            redirect_to @property, notice: "Le bien a été mise à jour avec succès."
        else
            render :edit
        end
    end

    def destroy
        @property.destroy
        redirect_to properties_url, notice: "L'annonce a été détruite avec succès."
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_property
        @property = Property.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def property_params
        params.require(:property).permit(:property_type_id, :ad_type_id, :title, :price, :room, :area, :etage, { feature: [] }, :description, :address, :city_id, :available, :deposit, { images: [] })
    end
end
