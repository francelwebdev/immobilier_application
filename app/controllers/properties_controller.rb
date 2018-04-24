class PropertiesController < ApplicationController
    before_action :set_property, only: [:show, :edit, :update, :destroy]
    skip_before_action :authenticate_user!, only: [:index, :show]

    def index
        
    end

    def publish
        @property_to_publish = Property.find(params[:id])
        @property_to_publish.update published: true
        redirect_to @property_to_publish, notice: 'Annonce publiée, OK'
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
        params.require(:property).permit(:property_type_id, :ad_type_id, :title, :price, :room, :area, :description, :address, :city, :available, :avance, :property_photo)
    end

end