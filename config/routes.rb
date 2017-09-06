Rails.application.routes.draw do

  root 'home#index'

  namespace :users do
    get '/:id/messages', to: 'conversations#index'
  end

  namespace :player do
    get '/:id/profile', to: 'profile#show'
    get '/profile/new', to: 'profile#new'
    get '/:id/favorite_player', to: 'favorite_player#create'
    patch '/:id/profile/edit', to: 'players#edit'
  end

  namespace :teams do
    get '/:id/stats', to: 'stats#index'
  end

  get '/logout', to: 'sessions#destroy'
  post '/send_text', to: 'twilio#create'
  post '/receive_text', to: 'twilio#update'

  resources :sessions, only: [:create, :destroy]
  resources :personal_messages, only: [:create]
  resources :conversations, only: [:index, :show]
  resources :athletes, as: :players, :controller => :players, only: [:show, :edit]
  resources :players, only: [:new, :create, :update]
  resources :dashboard, only: [:index]
end
