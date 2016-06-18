Rails.application.routes.draw do
  get 'search/animals'

  devise_for :users
  resources :facilities do
    resources :animals
  end
  resources :users, :only => [:index, :show]

  root 'page#index'
end
