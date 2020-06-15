Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'sessions#new'
  post '/', to: 'sessions#create'
  get 'signup', to: 'users#new'
  resources :users
  resources :opinions 
end
