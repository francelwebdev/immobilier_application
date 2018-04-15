Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'newsletters/new'

  get 'newsletters/create'

  get 'contacts/new'

  get 'contacts/create'

    root to: "pages#home"
    get "about_us", to: "pages#about_us"
    get "contact_us", to: "pages#contact_us"
    get "profesionnal/benefit", to: "pages#benefit_for_profesionnal"

    post 'properties/:id/publish' => 'properties#publish', as: "property_to_publish"

    devise_for :users

    # Pour profile
    # get 'profiles/show'
    # get "profile/:full_name", to: "profiles#show", as: "user_profile"

    resources :properties
    namespace :my_properties do
      get 'properties', to: 'properties#index'
      # resources :properties, only: [:index, :show, :edit, :delete]
  end
end
