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

  namespace :profiles do
    get '/player_profile/:id', to: 'player_profiles#show'
  end

  get '/dashboard', to: 'dashboard#index'
  get 'auth/facebook/callback', to: 'sessions#create'
  get 'auth/failiure', to: redirect('/')

  # get 'teams/:id/stats', to: 'stats#index'
  resources :athletes, as: :players, :controller => :players, only: [:show, :edit]
  patch 'player_profile', to: 'players#update'
  namespace :teams do
    get '/:id/stats', to: 'stats#index'
  end

  post '/send_text', to: 'twilio#create'
  post '/receive_text', to: 'twilio#update'
end
