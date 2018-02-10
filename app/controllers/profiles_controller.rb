class ProfilesController < ApplicationController
    before_action :set_profile, only: [:show, :edit, :update]

    def show
    end


    def edit
    end

    def update
      if @profile.update(profile_params)
        redirect_to @profile, notice: "Votre profile a été mise à jour avec succès."
      else
        render :edit, alert: "Le profile n'a pas été mise à jour"
      end
    end


    private

    def set_profile
        @profile = Profile.find(current_user.profile.id)
    end

    def profile_params
        params.require(:profile).permit(:first_name)
        # , :last_name, :city, :address, :phone_number, :user_id
    end
end
