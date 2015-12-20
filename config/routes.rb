Rails.application.routes.draw do

  get 'payments/new'

  get 'payments/create'

  resources :product_properties
  resources :variant_properties
  resources :variants
  resources :product_types
  resources :cart_items
  devise_for :users, :controllers => { :registrations => 'registrations' }
  resources :users
  resources :venues
  resources :store_configs
  resources :orders
  resources :products
  resources :payments
  root :to => 'venues#index'

  # for the queue-view
  match 'queue' => 'orders#queue', :via => [:get, :post]
  match 'orders/:id/complete' => 'orders#complete', :via => [:get, :post], :as => :complete_order

  match '*path', to: redirect('/'), via: :all

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
end
