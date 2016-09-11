Rails.application.routes.draw do
  get 'search/animals'

  devise_for :users
  resources :facilities do
    resources :animals
  end
  resources :users, :only => [:index, :show]

  resources :animals, only: [:show]


  namespace :settings do
    get '/', to: 'settings#list'
    resources :species, :except => [:new, :show], :controller => 'settings' do
      put :reorder, :on => :collection
    end
    resources :sexes, :except => [:new, :show], :controller => 'settings' do
      put :reorder, :on => :collection
    end
    resources :rearings, :except => [:new, :show], :controller => 'settings' do
      put :reorder, :on => :collection
    end
    resources :reproductive_statuses, :except => [:new, :show], :controller => 'settings' do
      put :reorder, :on => :collection
    end
    resources :facility_types, :except => [:new, :show], :controller => 'settings' do
      put :reorder, :on => :collection
    end
    resources :facility_expertises, :except => [:new, :show], :controller => 'settings' do
      put :reorder, :on => :collection
    end

  end
  

  root 'page#index'
end
