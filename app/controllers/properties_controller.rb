class PropertiesController < ApplicationController
  before_action :set_property, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new]

  # GET /properties
  # GET /properties.json
  def index
    @properties = Property.all.order("created_at DESC")
    @property_photos = @properties.property_photos.all
  end

  # GET /properties/1
  # GET /properties/1.json
  def show
    @property_photos = @property.property_photos.all
  end

  # GET /properties/new
  def new
    @current_user = User.find(current_user.id)
    @property = @current_user.properties.build
    @property_photo = @property.property_photos.build
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
        # params[:property_photos]['names'].each do |photo|
          @property_photo = @property.property_photos.create!(names: params[:property_photos]['name'], property_id: @property.id)
        # end

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
      @property = Property.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def property_params
      params.require(:property).permit(:property_type_id, :ad_type_id, :title, :price, :area, :room_id, :description, :address, :city, user_attributes: [:phone_number], property_photos_attributes: [:name])
    end
end
