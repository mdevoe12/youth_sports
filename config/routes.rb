Rails.application.routes.draw do
  root "home#index"

  get '/dashboard', to: 'dashboard#index'

  get 'auth/facebook/callback', to: 'sessions#create'
  get 'auth/failiure', to: redirect('/')
end
