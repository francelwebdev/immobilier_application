class PropertiesController < ApplicationController
    before_action :set_property, only: [:show, :edit, :update, :destroy]
    skip_before_action :authenticate_user!, only: [:index, :show]

    def publish
        @property_to_publish = Property.find(params[:id])
        @property_to_publish.update published: true, published_at: Time.now
        redirect_to @property_to_publish, notice: 'Annonce mise en ligne, OK'
    end

    def index
        if user_signed_in?
            if current_user.admin?
                @properties = Property.all.order("created_at DESC").page(params[:page]).per(6)
                @properties_numbers = @properties.count
            else
                if params[:property_type].present? and params[:ad_type].present? and params[:city].present?
                    @properties = Property.where("property_type_id = ? AND ad_type_id = ? AND city LIKE ?", params[:property_type].to_i, params[:ad_type].to_i, "%#{params[:city]}%").all.order("created_at DESC").published.page(params[:page]).per(6)
                    @properties_numbers = @properties.count
                elsif params[:property_type].present? and params[:ad_type].present? and params[:city].blank?
                    @properties = Property.where("property_type_id = ? AND ad_type_id = ?", params[:property_type].to_i, params[:ad_type].to_i).all.order("created_at DESC").published.page(params[:page]).per(6)
                    @properties_numbers = @properties.count
                elsif params[:property_type].present?
                    @property_type_id = PropertyType.find_by(name: params[:property_type]).id
                    @properties = Property.where("property_type_id = ?", @property_type_id).all.order("created_at DESC").published.page(params[:page]).per(6)
                    @properties_numbers = @properties.count
                elsif params[:ad_type].present?
                    @ad_type_id = AdType.find_by(name: params[:ad_type]).id
                    @properties = Property.where("ad_type_id = ?", @ad_type_id).all.order("created_at DESC").published.page(params[:page]).per(6)
                    @properties_numbers = @properties.count
                else
                    @properties = Property.all.order("created_at DESC").published.page(params[:page]).per(6)
                    @properties_numbers = @properties.count
                end
            end
        else
            if params[:property_type].present? and params[:ad_type].present? and params[:city].blank? and params[:room].blank? and params[:surface_minimum].blank? and params[:loyer_minimum].blank? and params[:loyer_maximum].blank?
                @properties = Property.where("property_type_id = ? AND ad_type_id = ?", params[:property_type].to_i, params[:ad_type].to_i).all.order("created_at DESC").published.page(params[:page]).per(6)
                @properties_numbers = @properties.count
            elsif params[:property_type].present? and params[:ad_type].present? and params[:city].present? and params[:room].blank? and params[:surface_minimum].blank? and params[:loyer_minimum].blank? and params[:loyer_maximum].blank?
                @properties = Property.where("property_type_id = ? AND ad_type_id = ? AND city LIKE ?", params[:property_type].to_i, params[:ad_type].to_i, "%#{params[:city]}%").all.order("created_at DESC").published.page(params[:page]).per(6)
                @properties_numbers = @properties.count



            elsif params[:property_type].present? and params[:ad_type].present? and params[:city].present? and params[:room].blank? and params[:surface_minimum].present? and params[:loyer_minimum].present? and params[:loyer_maximum].present?
                @properties = Property.where("property_type_id = ? AND ad_type_id = ? AND city LIKE ? AND area >= ? AND price BETWEEN #{params[:loyer_minimum].to_i} AND #{params[:loyer_maximum].to_i}", params[:property_type].to_i, params[:ad_type].to_i, "%#{params[:city]}%", params[:surface_minimum].to_i).all.order("created_at DESC").published.page(params[:page]).per(6)
                @properties_numbers = @properties.count

            elsif params[:property_type].present? and params[:ad_type].present? and params[:city].present? and params[:room].blank? and params[:surface_minimum].present? and params[:loyer_minimum].blank? and params[:loyer_maximum].blank?
                @properties = Property.where("property_type_id = ? AND ad_type_id = ? AND city LIKE ? AND area >= ?", params[:property_type].to_i, params[:ad_type].to_i, "%#{params[:city]}%", params[:surface_minimum].to_i).all.order("created_at DESC").published.page(params[:page]).per(6)
                @properties_numbers = @properties.count

            elsif params[:property_type].present? and params[:ad_type].present? and params[:city].present? and params[:room].blank? and params[:surface_minimum].blank? and params[:loyer_minimum].present? and params[:loyer_maximum].present?
                @properties = Property.where("property_type_id = ? AND ad_type_id = ? AND city LIKE ? AND price BETWEEN #{params[:loyer_minimum].to_i} AND #{params[:loyer_maximum].to_i}", params[:property_type].to_i, params[:ad_type].to_i, "%#{params[:city]}%").all.order("created_at DESC").published.page(params[:page]).per(6)
                @properties_numbers = @properties.count

            elsif params[:property_type].present? and params[:ad_type].present? and params[:city].blank?
                @properties = Property.where("property_type_id = ? AND ad_type_id = ?", params[:property_type].to_i, params[:ad_type].to_i).all.order("created_at DESC").published.page(params[:page]).per(6)
                @properties_numbers = @properties.count
            elsif params[:property_type].present?
                @property_type_id = PropertyType.find_by(name: params[:property_type]).id
                @properties = Property.where("property_type_id = ?", @property_type_id).all.order("created_at DESC").published.page(params[:page]).per(6)
                @properties_numbers = @properties.count
            elsif params[:ad_type].present?
                @ad_type_id = AdType.find_by(name: params[:ad_type]).id
                @properties = Property.where("ad_type_id = ?", @ad_type_id).all.order("created_at DESC").published.page(params[:page]).per(6)
                @properties_numbers = @properties.count
            else
                @properties = Property.all.order("created_at DESC").published.page(params[:page]).per(6)
                @properties_numbers = @properties.count
            end
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
            redirect_to @property, notice: "L'annonce a été créée avec succès, en attente de mise en ligne par un administrateur."
        else
            render :new
        end
    end

    def update
        if @property.update(property_params)
            redirect_to @property, notice: "L'annonce été mise à jour avec succès."
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
        params.require(:property).permit(:property_type_id, :ad_type_id, :title, :price, :room, :area, { feature: [] }, :description, :address, :city, :available, :avance, { photos: [] })
    end
end
