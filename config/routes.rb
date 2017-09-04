Rails.application.routes.draw do
  root "home#index"

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  namespace :profiles do
    get '/player_profile/:id', to: 'player_profiles#show'
  end

  get '/dashboard', to: 'dashboard#index'
  get 'auth/facebook/callback', to: 'sessions#create'
  get 'auth/failiure', to: redirect('/')

  # get 'teams/:id/stats', to: 'stats#index'
  namespace :teams do
    get '/:id/stats', to: 'stats#index'
  end

  post '/send_text', to: 'twilio#create'
  post '/receive_text', to: 'twilio#update'
end
