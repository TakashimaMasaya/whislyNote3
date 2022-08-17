Rails.application.routes.draw do
  namespace :admin do
    resources :users
    resources :whiskies
  end

  get 'relationships/followings'
  get 'relationships/followers'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  root to: 'whiskies#index'

  resources :whiskies do
    collection do
      get 'search'
      post 'addToUser'
    end
  end

  resources :users do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end
  
  resources :memos
  resources :blogs do
   resource :favorites, only: [:create, :destroy]
   resources :comments, only: [:create]  #commentsコントローラへのルーティング
  end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end