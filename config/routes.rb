Rails.application.routes.draw do

    root to: "welcome#index", as: "accueil"

    get "ads/apercu/:id", to: 'ads#apercu', as: 'voir_apercu'

    resources :ads
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
