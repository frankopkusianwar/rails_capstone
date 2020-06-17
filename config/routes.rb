Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'sessions#new'
  post '/', to: 'sessions#create'
  get 'signup', to: 'users#new'
  delete 'logout', to: 'sessions#destroy'
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :opinions
  resources :comments, only: [:create] 
  resources :followings, only: [:create, :destroy]
end
