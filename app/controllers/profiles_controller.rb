class ProfilesController < ApplicationController
    before_action :authenticate_user!

    def show
        @user_profile = current_user
    end
end
