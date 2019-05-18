Rails.application.routes.draw do
  root 'static_pages#index'
  get 'users/new'
  get 'users/create'
  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  resources :users
  resources :static_pages
end
