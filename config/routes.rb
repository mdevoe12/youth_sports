Rails.application.routes.draw do

  root 'home#index'

  get '/auth/facebook/callback', to: 'sessions#create'
  get '/auth/twitter/callback', to: 'sessions#create'


  resources :sessions, only: [:create, :destroy]
  resources :personal_messages, only: [:create]
  resources :conversations, only: [:index, :show]

  namespace :users do
    get '/:id/messages', to: 'conversations#index'
  end

  resources :players, only: [:new, :create, :update]
  get '/players/:id', to: 'players#show'
  resources :player_dashboard, only: [:show]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get "/logout", to: 'sessions#destroy'

  get '/player_profile', to: 'player_profile#show'
  get '/player_dashboard', to: 'player_dashboard#show'

  get '/dashboard', to: 'dashboard#index'

  get 'auth/facebook/callback', to: 'sessions#create'
  get 'auth/failiure', to: redirect('/')
  get '/coach', to: 'coach_dashboard#show'
  get '/favorite_player', to: 'favorite_player#create'
  # get 'teams/:id/stats', to: 'stats#index'
  resources :athletes, as: :players, :controller => :players, only: [:show]

  namespace :teams do
    get '/:id/stats', to: 'stats#index'
  end

end
