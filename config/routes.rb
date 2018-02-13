Rails.application.routes.draw do

    root to: "welcome#index", as: "accueil"

    devise_for :users

    # Mon code
    get "profile/:full_name", to: "users#show", as: "user_profile"

    resources :properties

      # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
