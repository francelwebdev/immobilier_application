class PropertiesController < ApplicationController
    before_action :set_property, only: [:show, :edit, :update, :destroy]
    skip_before_action :authenticate_user!, only: [:index, :show]

    def publish
        @property_to_publish = Property.find(params[:id])
        @property_to_publish.update published: true, published_at: Time.now, expire_at: 1.month.from_now
        redirect_to @property_to_publish, notice: 'Annonce mise en ligne, OK'
    end

    def deactivate
        @property_to_deactivate = Property.find(params[:id])
        @property_to_deactivate.update published: false
        redirect_to @property_to_deactivate, notice: 'Annonce désactiver, OK'
    end

    def index
        if params[:property_type].present? and params[:ad_type].blank? and params[:city].blank?
            @properties = Property.includes(:user).where("property_type = :property_type", { property_type: params[:property_type] }).published.all.order("created_at DESC").paginate(page: params[:page], per_page: 6)
            @properties_numbers = @properties.size
        elsif params[:property_type].present? and params[:ad_type].present? and params[:city].blank?
            @properties = Property.includes(:user).where("property_type = :property_type AND ad_type = :ad_type", { property_type: params[:property_type], ad_type: params[:ad_type] }).published.all.order("created_at DESC").paginate(page: params[:page], per_page: 6)
            @properties_numbers = @properties.size
        elsif params[:property_type].present? and params[:ad_type].present? and params[:city].present?
            @properties = Property.includes(:user).where("property_type = :property_type AND ad_type = :ad_type AND city = :city", { property_type: params[:property_type], ad_type: params[:ad_type], city: params[:city] }).published.all.order("created_at DESC").paginate(page: params[:page], per_page: 6)
            @properties_numbers = @properties.size
        elsif params[:property_type].blank? and params[:ad_type].present? and params[:city].present?
            @properties = Property.includes(:user).where("ad_type = :ad_type && city = :city", { ad_type: params[:ad_type], city: params[:city] }).published.all.order("created_at DESC").paginate(page: params[:page], per_page: 6)
            @properties_numbers = @properties.size
        elsif params[:property_type].blank? and params[:ad_type].blank? and params[:city].present?
            @properties = Property.includes(:user).where("city = :city", { city: params[:city] }).published.all.order("created_at DESC").paginate(page: params[:page], per_page: 6)
            @properties_numbers = @properties.size
        elsif params[:property_type].blank? and params[:ad_type].present? and params[:city].blank?
            @properties = Property.includes(:user).where("ad_type = :ad_type", { ad_type: params[:ad_type] }).published.all.order("created_at DESC").paginate(page: params[:page], per_page: 6)
            @properties_numbers = @properties.size





        else
            @properties = Property.includes(:user).all.order("created_at DESC").published.paginate(page: params[:page], per_page: 6)
            @properties_numbers = @properties.size
        end
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
            if params[:property][:user][:first_name].present? && params[:property][:user][:last_name].present? && params[:property][:user][:phone_number].present?
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
        params.require(:property).permit(:property_type, :ad_type, :title, :price, :room, :area, :etage, { feature: [] }, :description, :address, :city, :available, :deposit, { user_info: [] }, { images: [] })
    end
end
