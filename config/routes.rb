Rails.application.routes.draw do
  get '/offers/index', to: redirect('/')
  get 'offers/show'
  get 'projects/index'
  get 'projects/show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  root to: 'offers#index'

  resources :offers
  resources :projects

  get '/scroll_animator', to: 'scroll_animator#index'
  get '/offers/index', to: 'offers#index'
  get '/offers/show', to: 'offers#show'
  get '/projects/index', to: 'projects#index'
  get '/projects/show', to: 'projects#show'
  get '/offers/index', to: 'offers#index'
  get 'contact', to: 'pages#contact'
  get '/geocode', to: 'offers#index'

  post '/contact', to: 'contacts#create', as: 'contact_submission'

end
