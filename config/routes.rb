Rails.application.routes.draw do
  resources :animal_matches
  get 'search/animals'

  devise_for :users
  resources :facilities do
    resources :animals
  end

  resources :animals, only: [:show]

  root 'page#index'
end
