Rails.application.routes.draw do

  namespace :dashboard do
    get 'properties/index'
  end

    root to: "pages#home", as: "accueil"
    devise_for :users

    # Pour profile
    # get 'profiles/show'
    # get "profile/:full_name", to: "profiles#show", as: "user_profile"

    resources :properties
    namespace :dashboard do
        resources :properties, only: [:index, :show, :edit, :delete]
    end

    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
