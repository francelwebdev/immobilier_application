Rails.application.routes.draw do
    root to: "pages#home"
    post "contacts", to: "contacts#create"
    get "about_us", to: "pages#about_us"
    get "contact_us", to: "pages#contact_us"
    get "agency/benefits", to: "pages#benefits_for_agency"
    get "pricing_plan", to: "pages#pricing_plan"
    resources :newsletters, only: [:create]
    post 'properties/:id/publish', to: 'properties#publish', as: "property_to_publish"
    devise_for :users

    resources :properties
    scope "/dashboard" do
        get "my_properties", to: 'my_properties#index'
        resource :my_profiles, only: [:edit, :update]
    end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
