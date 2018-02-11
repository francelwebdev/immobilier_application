Rails.application.routes.draw do

  resources :properties
    root to: "welcome#index", as: "accueil"

    devise_for :users

  
    resources :profiles, only: [:show, :edit, :update]

      # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
