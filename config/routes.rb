Rails.application.routes.draw do
  get 'pages/welcom'

  get 'pages/user_agreement'

  get 'pages/question_and_answers'

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
  devise_for :users, :controllers => { :registrations => "registrations", :sessions => 'sessions' }

  get 'admin', to: 'admin/users#index'

  # Some default routes prepared for JS request
  resources :products
  resources :goods do
    resources :upstreams do
      resources :contact, only: [:update, :create, :destroy]
    end
  end

  resources :customers, only: [:update, :create, :destroy, :new, :show, :index] do
    resources :preferences, only: [:index, :update, :create, :destroy]
  end

  namespace :customer do
    resources :contacts,    only: [:update, :create, :destroy]
  end

  resources :orders do
    resources :deliverable, only: [:index]
  end

  # Namespace for admin
  namespace :admin do
    resources :users, only: [:index, :create, :update, :show] do
      member do
        put :disable
        put :enable
      end
    end
    resources :customers, only: [:index]
    resources :products, only: [:index, :create, :update, :new, :edit, :destroy] do
      member do
        put :archive
        put :activate
      end
    end
  end

  get 'dashboard' => 'dashboard#index', as: 'dashboard'
  get 'routes'    => 'sextant/routes#index'

  root :to => "dashboard#index"

end
