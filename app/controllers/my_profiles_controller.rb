class MyProfilesController < ApplicationController
    before_action :set_user_profile, only: [:edit, :update]

    def edit   

    end

    def update      
        if @user_profile.update(user_profile_params)
            redirect_to :edit, notice: "Le a bien été mise à jour."
        else
            render :edit
        end
    end

    private

    def set_user_profile
        @user_profile = UserProfile.find(current_user.user_profile.id)
    end

    def user_profile_params
        params.require(:user_profile).permit(:first_name, :last_name, :phone_number, :address)
    end
end
