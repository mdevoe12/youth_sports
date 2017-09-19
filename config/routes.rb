Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
  
  root 'home#index'
  patch '/player_profiles/:id', to: 'players#update'
  resources :users, only: [:index]

  get '/auth/twitter/callback', to: 'sessions#create'
  get '/auth/twitter', as: :twitter_login
  resources :favorite_players, only: [:create, :new]

  namespace :users do
    get '/:id/messages', to: 'conversations#index'
    get '/:id/favorite_player', to: 'favorite_player#create'
  end

  namespace :teams do
    get '/:id/stats', to: 'stats#index'
  end

  get  '/:id/messages', to: 'conversations#index'
  get  '/:id/favorite_player', to: 'favorite_player#create'
  get  '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get  '/logout', to: 'sessions#destroy'
  post '/send_text', to: 'twilio#create'
  post '/receive_text', to: 'twilio#update'


  resources :players, only: [:new, :create, :update, :edit]
  resources :player_profiles, only: [:new, :create, :show, :index]
  resources :coach_profiles, only: [:show, :index]

  resources :personal_messages, only: [:new, :create]
  resources :conversations, only: [:index, :show]
  resources :recruiters, only: [:new, :create, :update]
  resources :recruiter_profiles, only: [:new, :create, :show, :index]
  resources :dashboard, only: [:index]
  resources :uploads, only: [:create]

  # internal api
  namespace :api do
    namespace :v1 do
      get 'players/stats', to: 'player_stats#show'
      get 'players/points', to: 'player_points#show'
    end
  end

end
