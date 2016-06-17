Rails.application.routes.draw do
  devise_for :users
  resources :facilities
  resources :animals
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'page#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end

# Prefix Verb   URI Pattern                    Controller#Action
#        new_user_session GET    /users/sign_in(.:format)       devise/sessions#new
#            user_session POST   /users/sign_in(.:format)       devise/sessions#create
#    destroy_user_session DELETE /users/sign_out(.:format)      devise/sessions#destroy
#           user_password POST   /users/password(.:format)      devise/passwords#create
#       new_user_password GET    /users/password/new(.:format)  devise/passwords#new
#      edit_user_password GET    /users/password/edit(.:format) devise/passwords#edit
#                         PATCH  /users/password(.:format)      devise/passwords#update
#                         PUT    /users/password(.:format)      devise/passwords#update
# cancel_user_registration GET    /users/cancel(.:format)        devise/registrations#cancel
#       user_registration POST   /users(.:format)               devise/registrations#create
#   new_user_registration GET    /users/sign_up(.:format)       devise/registrations#new
#  edit_user_registration GET    /users/edit(.:format)          devise/registrations#edit
#                         PATCH  /users(.:format)               devise/registrations#update
#                         PUT    /users(.:format)               devise/registrations#update
#                         DELETE /users(.:format)               devise/registrations#destroy
#              facilities GET    /facilities(.:format)          facilities#index
#                         POST   /facilities(.:format)          facilities#create
#            new_facility GET    /facilities/new(.:format)      facilities#new
#           edit_facility GET    /facilities/:id/edit(.:format) facilities#edit
#                facility GET    /facilities/:id(.:format)      facilities#show
#                         PATCH  /facilities/:id(.:format)      facilities#update
#                         PUT    /facilities/:id(.:format)      facilities#update
#                         DELETE /facilities/:id(.:format)      facilities#destroy
#                 animals GET    /animals(.:format)             animals#index
#                         POST   /animals(.:format)             animals#create
#              new_animal GET    /animals/new(.:format)         animals#new
#             edit_animal GET    /animals/:id/edit(.:format)    animals#edit
#                  animal GET    /animals/:id(.:format)         animals#show
#                         PATCH  /animals/:id(.:format)         animals#update
#                         PUT    /animals/:id(.:format)         animals#update
#                         DELETE /animals/:id(.:format)         animals#destroy
#                    root GET    /                              page#index
