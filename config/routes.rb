Rails.application.routes.draw do
  root "home#index"

  get '/login', to: 'sessions#new'

  get '/dashboard', to: 'dashboard#index'

  get 'auth/facebook/callback', to: 'sessions#create'
  get 'auth/failiure', to: redirect('/')
end
