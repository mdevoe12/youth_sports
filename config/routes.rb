Rails.application.routes.draw do
  get '/dashboard', to: 'dashboard#index'
end
