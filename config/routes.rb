Rails.application.routes.draw do

    root to: "welcome#index", as: "accueil"

    devise_for :users

    # Pour profile
    # get 'profiles/show'

    # get "profile/:full_name", to: "profiles#show", as: "user_profile"

    resources :properties

    namespace :my_ads do
        resources :properties, only: [:index, :show, :edit, :delete]
    end
    



    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
