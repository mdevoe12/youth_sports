Rails.application.routes.draw do
  root "home#index"

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  get '/player_profile', to: 'player_profile#show'

  get '/dashboard', to: 'dashboard#index'

  get 'auth/facebook/callback', to: 'sessions#create'
  get 'auth/failiure', to: redirect('/')
  get '/coach', to: 'coach_dashboard#show'

  # get 'teams/:id/stats', to: 'stats#index'
  namespace :teams do
    get '/:id/stats', to: 'stats#index'
  end
end
