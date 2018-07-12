Rails.application.routes.draw do
	devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
	scope "/(:locale)", locale: /fr/ do
		root to: "pages#home", as: "home_page"
        resource :agency, only: :show
        resources :agencies, only: [:index, :show, :edit] do
            resources :properties
        end
        get "agency/benefits", to: "pages#benefits_for_agency", as: "agency_benefits"
		get "about_us", to: "pages#about_us", as: "about_us"
		get "contact_us", to: "pages#contact_us", as: "contact_us"
		get "faq", to: "pages#faq", as: "faq"
		get "pricing_plan", to: "pages#pricing_plan", as: "pricing_plan"
		get "terms_and_conditions", to: "pages#terms_and_conditions", as: "terms_and_conditions"
		post 'properties/:id/publish', to: 'properties#publish', as: "publish_property"
		post 'properties/:id/deactivate', to: 'properties#deactivate', as: "deactivate_property"
		resources :properties
		get "search_property", to: "properties#search_property"
		resources :messages, only: :create
		resources :contacts, only: :create
		resources :newsletters, only: :create
		scope "/dashboard" do
			resources :my_properties, only: [:index, :edit, :destroy]
		end
	end
	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
