class ProfilesController < ApplicationController
	before_action :set_profile, only: [:show, :edit, :update]

	def show
		
	end

	def edit
		
	end

	def update
        if @profile.update(profile_params)
            redirect_to @profile, notice: "Le profile a été mise à jour avec succès."
        else
            render :edit
        end
    end


	private

	def set_profile
		@profile = current_user.profile
	end

	def profile_params
		params.require(:profile).permit(:first_name, :last_name, :phone_number)
	end
end