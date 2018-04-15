Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "pages#home"

  post "contacts", to: "contacts#create"

  get "about_us", to: "pages#about_us"

  get "contact_us", to: "pages#contact_us"

  get "profesionnal/benefits", to: "pages#benefits_for_profesionnal"

  get "pricing_plan", to: "pages#pricing_plan"

  resources :newsletters, only: [:create]

  post 'properties/:id/publish' => 'properties#publish', as: "property_to_publish"

  devise_for :users

    # Pour profile
    # get 'profiles/show'
    # get "profile/:full_name", to: "profiles#show", as: "user_profile"

    resources :properties

    scope "/dashboard" do
      get 'my_properties/index'
      resource :my_profiles, only: [:show, :edit]

    end
  end