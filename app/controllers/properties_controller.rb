class PropertiesController < ApplicationController
    skip_before_action :authenticate_user!, only: [:index, :show]
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

    def search_property
        if params.has_key?(:property_type) and params.has_key?(:ad_type) and params.has_key?(:city) and !params.has_key?(:room) and !params.has_key?(:price) and !params.has_key?(:area)
            @properties = Property.includes(:user).where("property_type = :property_type or ad_type = :ad_type or city = :city or description LIKE :description or title LIKE :title or address LIKE :address", property_type: params[:property_type], ad_type: params[:ad_type], city: params[:city].capitalize, description: "%#{params[:city].downcase}%", title: "%#{params[:city].downcase}%", address: "%#{params[:city].downcase}%").published.all.order("created_at DESC").paginate(page: params[:page], per_page: 6)
            @properties_numbers = @properties.count
        elsif params.has_key?(:property_type) and params.has_key?(:ad_type) and params.has_key?(:city) and params.has_key?(:room) and params.has_key?(:price) and params.has_key?(:area)
            if !params[:price].empty? and params[:area].empty?
                @properties = Property.includes(:user).where("property_type = :property_type or ad_type = :ad_type or city = :city or room = :room or price <= :price or area >= :area or description LIKE :description or title LIKE :title or address LIKE :address", property_type: params[:property_type], ad_type: params[:ad_type], city: params[:city].capitalize, room: params[:room], price: params[:price].to_i, area: nil, description: "%#{params[:city].downcase}%", title: "%#{params[:city].downcase}%", address: "%#{params[:city].downcase}%").published.all.order("created_at DESC").paginate(page: params[:page], per_page: 6)
                @properties_numbers = @properties.count
            elsif params[:price].empty? and params[:area].empty?
                @properties = Property.includes(:user).where("property_type = :property_type or ad_type = :ad_type or city = :city or room = :room or price <= :price or area >= :area or description LIKE :description or title LIKE :title or address LIKE :address", property_type: params[:property_type], ad_type: params[:ad_type], city: params[:city].capitalize, room: params[:room], price: nil, area: nil, description: "%#{params[:city].downcase}%", title: "%#{params[:city].downcase}%", address: "%#{params[:city].downcase}%").published.all.order("created_at DESC").paginate(page: params[:page], per_page: 6)
                @properties_numbers = @properties.count
            else
                @properties = Property.includes(:user).where("property_type = :property_type or ad_type = :ad_type or city = :city or room = :room or price <= :price or area >= :area or description LIKE :description or title LIKE :title or address LIKE :address", property_type: params[:property_type], ad_type: params[:ad_type], city: params[:city].capitalize, room: params[:room], price: nil, area: params[:area].to_i, description: "%#{params[:city].downcase}%", title: "%#{params[:city].downcase}%", address: "%#{params[:city].downcase}%").published.all.order("created_at DESC").paginate(page: params[:page], per_page: 6)
                @properties_numbers = @properties.count
            end
        elsif params.has_key?(:property_type) and !params.has_key?(:ad_type) and !params.has_key?(:city) and !params.has_key?(:room) and !params.has_key?(:price) and !params.has_key?(:area)
            @properties = Property.includes(:user).where("property_type = :property_type", property_type: params[:property_type]).published.all.order("created_at DESC").paginate(page: params[:page], per_page: 6)
            @properties_numbers = @properties.count
        elsif !params.has_key?(:property_type) and params.has_key?(:ad_type) and !params.has_key?(:city) and !params.has_key?(:room) and !params.has_key?(:price) and !params.has_key?(:area)
            @properties = Property.includes(:user).where("ad_type = :ad_type", ad_type: params[:ad_type]).published.all.order("created_at DESC").paginate(page: params[:page], per_page: 6)
            @properties_numbers = @properties.count
        end
    end

    def index
        @properties = Property.includes(:user).all.order("created_at DESC").published.paginate(page: params[:page], per_page: 4)
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
        params.require(:property).permit(:property_type, :ad_type, :title, :price, :room, :area, :etage, { feature: [] }, :description, :address, :city, :available, :deposit, { images: [] })
    end
end
