Rails.application.routes.draw do
  get 'auth/facebook/callback', to: 'sessions#create'
  get 'auth/failiure', to: redirect('/')

  # get 'teams/:id/stats', to: 'stats#index'

  namespace :teams do
    get '/:id/stats', to: 'stats#index'
  end
end
