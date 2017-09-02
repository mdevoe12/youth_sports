Rails.application.routes.draw do
  root 'home#index'
  
  get 'auth/facebook/callback', to: 'sessions#create'
  get 'auth/failiure', to: redirect('/')

  resources :personal_messages, only: [:create]
  resources :conversations, only: [:index, :show]

  namespace :users do
    get '/:id/messages', to: 'conversations#index'
  end

  delete '/logout', to: 'sessions#destroy'
end
