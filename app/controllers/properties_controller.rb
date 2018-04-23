class PropertiesController < ApplicationController
    before_action :set_property, only: [:show, :edit, :update, :destroy]
    skip_before_action :authenticate_user!, only: [:index, :show]

    def publish
        @property_to_publish = Property.find(params[:id])
        @property_to_publish.update published: true
        redirect_to @property_to_publish, notice: 'Annonce publiée, OK'
    end

    def index
        if user_signed_in? and current_user.role == "Administrateur"
            @properties = Property.all.order("created_at DESC").page(params[:page]).per(9)
            @properties_numbers = @properties.count
        elsif user_signed_in? and current_user.role != "Administrateur"
            if params[:ad_type].present? and params[:property_type].blank? and params[:city].blank?
                @ad_type_id = AdType.find_by(name: params[:ad_type]).id
                @properties = Property.where("ad_type_id = ?", @ad_type_id).all.order("created_at DESC").published.page(params[:page]).per(6)
                @properties_numbers = @properties.count
            elsif params[:property_type].present? and params[:ad_type].blank? and params[:city].blank?
                @property_type_id = PropertyType.find_by(name: params[:property_type]).id
                @properties = Property.where("property_type_id = ?", @property_type_id).all.order("created_at DESC").published.page(params[:page]).per(6)
                @properties_numbers = @properties.count
            elsif params[:city].present? and params[:property_type].blank? and params[:ad_type].blank?
                @properties = Property.where("city LIKE ? AND address LIKE ?", "%#{params[:city]}%", "%#{params[:city]}%").all.order("created_at DESC").published.page(params[:page]).per(6)
                @properties_numbers = @properties.count
            elsif params[:property_type].present? and params[:ad_type].present? and params[:city].present?
                @properties = Property.where("property_type_id = ? AND ad_type_id = ? AND city LIKE ?", params[:property_type].to_i, params[:ad_type].to_i, "%#{params[:city]}%").all.order("created_at DESC").published.page(params[:page]).per(6)
                @properties_numbers = @properties.count
            else
                @properties = Property.all.order("created_at DESC").published.page(params[:page]).per(9)
                @properties_numbers = @properties.count
            end
        else
            if params[:ad_type].present? and params[:property_type].blank? and params[:city].blank?
                @ad_type_id = AdType.find_by(name: params[:ad_type]).id
                @properties = Property.where("ad_type_id = ?", @ad_type_id).all.order("created_at DESC").published.page(params[:page]).per(6)
                @properties_numbers = @properties.count
            elsif params[:property_type].present? and params[:ad_type].blank? and params[:city].blank?
                @property_type_id = PropertyType.find_by(name: params[:property_type]).id
                @properties = Property.where("property_type_id = ?", @property_type_id).all.order("created_at DESC").published.page(params[:page]).per(6)
                @properties_numbers = @properties.count
            elsif params[:city].present? and params[:property_type].blank? and params[:ad_type].blank?
                @properties = Property.where("city LIKE ? AND address LIKE ?", "%#{params[:city]}%", "%#{params[:city]}%").all.order("created_at DESC").published.page(params[:page]).per(6)
                @properties_numbers = @properties.count
            elsif params[:property_type].present? and params[:ad_type].present? and params[:city].present?
                @properties = Property.where("property_type_id = ? AND ad_type_id = ? AND city LIKE ?", params[:property_type].to_i, params[:ad_type].to_i, "%#{params[:city]}%").all.order("created_at DESC").published.page(params[:page]).per(6)
                @properties_numbers = @properties.count
            else
                @properties = Property.all.order("created_at DESC").published.page(params[:page]).per(9)
                @properties_numbers = @properties.count
            end
        end
    end

    def show
    end

    def new
        @property = current_user.properties.build
    end

    def edit
    end

    def create
        @property = current_user.properties.build(property_params)
        if @property.save
            redirect_to @property, notice: "L'annonce a été créée avec succès, en attente de publication par un administrateur."
        else
            render :new
        end
    end

    def update
        if @property.update(property_params)
            redirect_to @property, notice: "L'annonce a bien été mise à jour, en attente de republication par un administrateur."
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
        params.require(:property).permit(:property_type_id, :ad_type_id, :title, :price, :room, :area, :description, :bedroom, :bathroom, :address, :city, :available, :avance, property_photos: [])
    end
end
