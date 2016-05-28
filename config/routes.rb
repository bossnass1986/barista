Rails.application.routes.draw {
  scope('(:locale)', locale: /#{I18n.available_locales.join('|')}/) {

    concern(:paginatable) { get '(page/:page)', :action => :index, :on => :collection, :as => '' }

    resources :users, controller: :users, only: :create

    resources :images

    get 'admin' => 'admin/dashboard#index'
    get 'admin/merchandise' => 'admin/merchandise/summary#index'

    resource :about, only: [:show]
    resources :states, only: [:index]
    resources :terms, only: [:index]
    resource :unsubscribe, only: :show
    resources :wish_items, only: [:index, :destroy]

    namespace(:customer) {
      resources :registrations, only: [:index, :new, :create]
      resource :password_reset, only: [:new, :create, :edit, :update]
      resource :activation, only: [:show]
    }

    namespace(:myaccount) {
      resources :orders, only: [:index, :show]
      resources :addresses
      resources :credit_cards
      resources :referrals, only: [:index, :create, :update]
      resource :store_credit, only: [:show]
      resource :overview, only: [:index, :show, :edit, :update]
    }

    namespace(:shopping) {
      resources(:merchants, only: [:index, :show]) { resources :products, only: [:index, :show, :create] }

      resources(:cart_items) { member { put :move_to } }
      resource :coupons, only: [:show, :create]

      resources(:orders) {
        member {
          get :checkout
          get :confirmation
        }
      }
      resources :shipping_methods
    }

    namespace(:admin) {
      scope(:strongbolt) { strongbolt }
      resource :dashboard, only: [:index]
      namespace(:customer_service) {
        resources(:users) { resources :comments }
      }
      resources :users
      namespace(:user_datas) {

        resources(:referrals) { member { post :apply } }

        resources(:users) {
          resource :store_credits, only: [:show, :edit, :update]
          resources :addresses
        }
      }
      resources :merchants
      get 'help' => 'help#index'

      namespace(:history) {
        resources(:orders, only: [:index, :show]) {# resources  :addresses, only: [:index, :show, :edit, :update, :new, :create]}
        }

        namespace(:fulfillment) {
          resources(:orders) {
            member { put :create_shipment }
            resources :comments
          }

          namespace(:partial) {
            resources(:orders) { resources :shipments, only: [:create, :new, :update] }
          }

          resources(:shipments) {
            member { put :ship }
            resources :addresses, only: [:edit, :update] # This is for editing the shipment address
          }
        }
        namespace(:shopping) {
        resources :carts
        resources :products
        resources :users
        namespace(:checkout) {
          resources(:billing_addresses, only: [:index, :update, :new, :create, :select_address]) { member { put :select_address } }
          resources :credit_cards
          resource(:order, only: [:show, :update, :start_checkout_process]) { member { post :start_checkout_process } }
          resources(:shipping_addresses, only: [:index, :update, :new, :create, :select_address]) {
            member { put :select_address }
          }
          resources :shipping_methods, only: [:index, :update]
        }
        }
        namespace(:config) {
        resources :accounts
        resources(:countries, only: [:index, :edit, :update, :destroy]) { member { put :activate } }
        resources :tax_rates
        }

        namespace(:generic) {
        resources :coupons
        }
        namespace(:inventory) {
        resources :merchants
        }

        namespace(:merchandise) {
          namespace(:images) { resources :products, :concerns => :paginatable }
        resources :image_groups
        resources :properties
        resources :prototypes
        resources :brands
        resources :product_types
        resources :prototype_properties

          namespace(:changes) { resources(:products) }

          namespace(:multi) {
            resources(:products) { resource :variant, only: [:edit, :update] }
          }
          resources(:products) {
            member {
            get :add_properties
            put :activate
            }
          resources :variants
          }
          namespace(:products) { resources :descriptions, only: [:edit, :update] }
        }
        namespace(:document) { resources :invoices }
      }
    }
    root :to => 'shopping/merchants#index'
  }
}
