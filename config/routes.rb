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

end
