Rails.application.routes.draw do
  get 'auth/facebook/callback', to: 'sessions#create'
  get 'auth/failiure', to: redirect('/')

  resources :teams, param: :slug do
    resources :stats, only: [:index]
  end
end
