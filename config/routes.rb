Rails.application.routes.draw do
  root 'application#index'

  resources :routes, only: [:show, :update]
  resources :variables, only: :create

  post '/routes/:id', to: 'routes#update'
  get '/embed/:id', to: 'routes#embed'
  get '/test_page', to: 'application#test'
end
