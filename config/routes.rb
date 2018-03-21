Rails.application.routes.draw do
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  
  get 'rankings/like', to: 'rankings#like'
  resources :users, only: [:show, :new, :create]
  
  resources :categories, only: [:index, :show]
  
  resources :microposts, only: [:index, :new, :create, :destroy] do
      resources :likes, only: [:create, :destroy]
  end
end
