Rails.application.routes.draw do
  get 'events/new'

  get 'events/create'

  get 'events/show'

  root 'static_pages#index'
  get 'users/new'
  get 'users/create'
  get  'signup',    to: 'users#new'
  get  'login',     to: 'sessions#new'
  post 'login',     to: 'sessions#create'
  get  'logout',    to: 'sessions#destroy'
  get  'new_event', to: 'events#new'
  post 'new_event', to: 'events#create'
  resources :events
  resources :users
  resources :static_pages
end
