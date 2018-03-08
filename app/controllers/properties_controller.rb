class PropertiesController < ApplicationController
  before_action :set_property, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  # GET /properties
  # GET /properties.json
  def index
    if params[:property_type].present? and params[:ad_type].present? and params[:city].present?
      @properties = Property.where("property_type_id = ? and ad_type_id = ? and city LIKE ? or city LIKE ?", params[:property_type].to_i, params[:ad_type].to_i, params[:city], params[:city])
      @total_properties = @properties.count
    else
      @properties = Property.all.order("created_at DESC")
      @total_properties = @properties.count
    end
  end

  # GET /properties/1
  # GET /properties/1.json
  def show
    @property_photos = @property.property_photos.all
  end

  # GET /properties/new
  def new
    @property = current_user.properties.build
    @property.build_user
    @property_photos = @property.property_photos.build
  end

  # GET /properties/1/edit
  def edit
  end

  # POST /properties
  # POST /properties.json
  def create
    @property = current_user.properties.build(property_params)

    respond_to do |format|
	  if @property.save
      params[:property_photos]['photo'].each do |photo|
          @property_photo = @property.property_photos.create!(photo: photo, property_id: @property.id)
       end
        format.html { redirect_to @property, notice: 'Property was successfully created.' }
        format.json { render :show, status: :created, location: @property }
      else
        format.html { render :new }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /properties/1
  # PATCH/PUT /properties/1.json
  def update
    respond_to do |format|
      if @property.update(property_params)
        format.html { redirect_to @property, notice: 'Property was successfully updated.' }
        format.json { render :show, status: :ok, location: @property }
      else
        format.html { render :edit }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /properties/1
  # DELETE /properties/1.json
  def destroy
    @property.destroy
    respond_to do |format|
      format.html { redirect_to properties_url, notice: 'Property was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_property
      @property = Property.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def property_params
      params.require(:property).permit(:property_type_id, :ad_type_id, :title, :price, :area, :description, :address, :city, property_photos_attributes: [:photo], user_attributes: [:first_name, :last_name, :phone_number])
    end
end
