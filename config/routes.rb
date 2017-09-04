Rails.application.routes.draw do

  root 'home#index'

  get '/auth/facebook/callback', to: 'sessions#create'
  get '/new_user', to: 'users#new'

  resources :sessions, only: [:create, :destroy]
  resources :personal_messages, only: [:create]
  resources :conversations, only: [:index, :show]

  namespace :users do
    get '/:id/messages', to: 'conversations#index'
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  get '/:id/player_profile', to: 'player_profile#show', as: 'player_profile'

  get '/dashboard', to: 'dashboard#index'

  get 'auth/facebook/callback', to: 'sessions#create'
  get 'auth/failiure', to: redirect('/')

  # get 'teams/:id/stats', to: 'stats#index'
  namespace :teams do
    get '/:id/stats', to: 'stats#index'
  end

end
