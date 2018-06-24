class AgenciesController < ApplicationController
    before_action :set_agency, only: [:show, :edit, :update, :destroy]
    skip_before_action :authenticate_user!, only: [:index, :show]

  def index
      @agencies = Agency.all
  end

  def show
      
  end

  def edit
      
  end

  def update

  end

  def destroy

  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_agency
      @agency = Agency.friendly.find(params[:id])
  end
end
