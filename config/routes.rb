Rails.application.routes.draw do
  get 'search/animals'

  devise_for :users
  resources :facilities do
    resources :animals
  end

  resources :animals, only: [:show]

  root 'page#index'
end
