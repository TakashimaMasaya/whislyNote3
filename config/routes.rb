Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  root to: 'whiskies#index'

  resources :whiskies
  resources :users
  resources :memos
  # resources :blogs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end