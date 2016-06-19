Rails.application.routes.draw do
  get 'search/animals'

  devise_for :users
  resources :facilities do
    resources :animals
  end
  resources :users, :only => [:index, :show, :approved]
  namespace :users do
    post 'not_approved', as: 'not_approved', to: 'users#not_approved'
  end

  resources :animals, only: [:show]

  root 'page#index'
end
