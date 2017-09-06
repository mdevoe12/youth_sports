Rails.application.routes.draw do

  patch '/player_profiles/:id', to: 'players#update'
  root 'home#index'

  namespace :users do
    get '/:id/messages', to: 'conversations#index'
    get '/:id/favorite_player', to: 'favorite_player#create'
  end

  namespace :teams do
    get '/:id/stats', to: 'stats#index'
  end

  get '/logout', to: 'sessions#destroy'
  post '/send_text', to: 'twilio#create'
  post '/receive_text', to: 'twilio#update'

  resources :players, only: [:new, :create, :update]
  resources :player_profiles, only: [:new, :create, :show]
  resources :sessions, only: [:create, :destroy]
  resources :personal_messages, only: [:create]
  resources :conversations, only: [:index, :show]
  resources :athletes, as: :players, :controller => :players, only: [:show, :edit]
  resources :dashboard, only: [:index]

end
