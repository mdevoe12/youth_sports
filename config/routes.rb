Rails.application.routes.draw do

  root 'home#index'
  patch '/player_profiles/:id', to: 'players#update'
  resources :users, only: [:index]

  get '/auth/twitter/callback', to: 'sessions#create'
  get '/auth/twitter', as: :twitter_login
  get '/favorite_player', to: 'favorite_player#create'

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

  resources :players, only: [:new, :create, :update]
  resources :player_profiles, only: [:new, :create, :show]
  resources :coach_profiles, only: [:show]
  # resources :sessions, only: [:create, :destroy]
  resources :personal_messages, only: [:new, :create]
  resources :conversations, only: [:new, :index, :show]
  resources :athletes, as: :players, :controller => :players, only: [:show, :edit]
  resources :recruiters, only: [:new, :create, :update]
  resources :recruiter_profiles, only: [:new, :create, :show]
  resources :dashboard, only: [:index]

  # internal api
  namespace :api do
    namespace :v1 do
      get 'players/stats', to: 'player_stats#show'
      get 'players/points', to: 'player_points#show'
    end
  end

end
