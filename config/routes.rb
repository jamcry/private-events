Rails.application.routes.draw do
  get 'users/new'

  get 'users/create'
  resources :users
  resources :static_pages
end
