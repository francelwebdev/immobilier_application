Rails.application.routes.draw do

    root to: "pages#home", as: "home_page"

    get "a_propos_de_nous", to: "pages#about_us", as: "about_us"

    get "contactez_nous", to: "pages#contact_us", as: "contact_us"

    get "foire_aux_questions", to: "pages#faq", as: "faq"

    get "nos_tarifs", to: "pages#pricing", as: "pricing"

    get "agency/benefits", to: "pages#benefits_for_agency", as: "agency_benefits"

    get "terms_and_conditions", to: "pages#terms_and_conditions", as: "terms_and_conditions"

    post 'properties/:id/publish', to: 'properties#publish', as: "publish_property"

    post 'send_message_to_owner/:owner_id/send_message_to_owner', to: 'messages#send_message_to_owner', as: "send_message_to_owner"

    devise_for :users

    resources :properties

    resources :messages, only: [:create]

    resources :contacts, only: [:create]

    resources :newsletters, only: [:create]

    scope "/dashboard" do
        resources :my_properties
    end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
