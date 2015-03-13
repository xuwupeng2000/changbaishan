Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
  #

  # Routes for devise login logoff etc.
  devise_for :users

  get 'admin', to: 'admin/users#index'

  # Some default routes prepared for JS request
  resources :products

  resources :customers do
    resources :preferences, only: [:index, :update, :create, :destroy]
    resources :contacts,    only: [:index, :update, :create, :destroy]
  end

  resources :orders do
    resources :sub_orders,  only: [:index, :update, :create, :destroy]
    resources :deliverable, only: [:index, :update, :create, :destroy]
  end

  # Namespace for admin
  namespace :admin do
    resources :users, only: [:index, :create, :update]
    resources :costomers, only: [:index, :create, :update]
    resources :products, only: [:index, :create, :update]
  end

  get 'dashboard' => 'dashboard#index', as: 'dashboard'
  get 'routes'    => 'sextant/routes#index'

  root :to => "dashboard#index"

end
