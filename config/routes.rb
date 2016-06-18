Rails.application.routes.draw do
  devise_for :users
  resources :facilities do
    resources :animals
  end

  resources :animals, only: [] do
    collection do
      get 'search'
    end
  end

  root 'page#index'
end
