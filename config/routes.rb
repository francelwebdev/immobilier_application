Rails.application.routes.draw do    
  
    root to: "pages#home", as: "home_page"

    get "about_us", to: "pages#about_us", as: "about_us"

    get "agency/benefits", to: "pages#benefits_for_agency", as: "agency_benefits"

    get "pricing", to: "pages#pricing", as: "pricing"

    get "faq", to: "pages#faq", as: "faq"

    get "terms_and_conditions", to: "pages#terms_and_conditions", as: "terms_and_conditions"

    post 'properties/:id/publish', to: 'properties#publish', as: "publish_property"

    devise_for :users

    resources :properties do
        post "properties/send_message_to_seller"
    end

    resources :contacts, only: [:new, :create]

    resources :newsletters, only: [:create]

    scope "/dashboard" do
        resources :my_properties
    end
    
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
