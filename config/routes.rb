Rails.application.routes.draw do

  scope '(:locale)', locale: /#{I18n.available_locales.join('|')}/ do

    concern :paginatable do
      get '(page/:page)', :action => :index, :on => :collection, :as => ''
    end

    namespace :legal do
      resource :terms, only: [:show]
    end

    resources :passwords, controller: 'clearance/passwords', only: [:create, :new]
    resource :session, controller: 'clearance/sessions', only: [:create]

    resources :users, controller: 'clearance/users', only: [:create] do
      resource :password,
               controller: 'clearance/passwords',
               only: [:create, :edit, :update]
    end

    get '/sign_in' => 'clearance/sessions#new', as: 'sign_in'
    # match '/sign_out' => 'clearance/sessions#destroy', :via => :delete
    delete '/sign_out' => 'clearance/sessions#destroy', as: 'sign_out'
    get '/sign_up' =>'clearance/users#new', as: 'sign_up'

    constraints Clearance::Constraints::SignedIn.new do
      root to: 'shopping/merchants#index', as: :signed_in_root
    end

    constraints Clearance::Constraints::SignedOut.new do
      root to: 'clearance/sessions#new'
    end

    resources :after_signup, only: [:show, :update]

    resources :users, controller: :users, only: :create

    resources :merchant_types
    resources :accounts
    resources :checkouts, only: [:new, :create, :show]
    get 'admin' => 'admin/dashboard#index'
    get 'admin/merchandise' => 'admin/merchandise/summary#index'

    resource :about, only: [:show]
    resources :states, only: [:index]



    namespace :profile do
      resources :orders, only: [:index, :show]
      resources :addresses
      resources :referrals, only: [:index, :create, :update]
      resources :payment_methods
      resource :store_credit, only: [:show, :update]
      resource :overview, only: [:index, :show, :edit, :update]
    end

    namespace :shopping do
      resources :merchants, only: [:index, :show] do
        resources :products, only: [:index, :show, :create]
      end

      resources :cart_items do
        member do
          put :move_to
        end
      end
      resource :coupons, only: [:show, :create]

      resources :orders do
        member do
          get :checkout
          get :confirmation
        end
      end
      resources :shipping_methods
    end

    namespace :admin do
      resource :dashboard, only: [:index]
      namespace :customer_service do
        resources :users do
          resources :comments
        end
      end
      resources :users
      namespace :user_datas do

        resources :referrals do
          member do
            post :apply
          end
        end

        resources :users do
          resource :store_credits, only: [:show, :edit, :update]
                end
      end
      # resources :overviews, only: [:index]
      resources :merchants
      get "help" => "help#index"


      namespace :history do
        resources :orders, only: [:index, :show] do
        end
      end

      namespace :fulfillment do
        resources :orders do
          # member do
          #   put :create_shipment
          # end
          resources :comments
        end

      end
      namespace :shopping do
        resources :carts
        resources :products
        resources :users
        namespace :checkout do
          resources :credit_cards
          resource :order, only: [:show, :update, :start_checkout_process] do
            member do
              post :start_checkout_process
            end
          end
        end
      end
      namespace :config do
        resources :accounts
        resources :countries, only: [:index, :edit, :update, :destroy] do
          member do
            put :activate
          end
        end
        resources :overview, only: [:index]
        resources :tax_rates
        # resources :tax_categories
      end

      namespace :generic do
        resources :coupons
        # resources :deals
        # resources :sales
      end
      namespace :inventory do
        resources :merchants
      end

      namespace :merchandise do
        namespace :images do
          resources :products, :concerns => :paginatable
        end
        resources :properties
        resources :prototypes
        resources :product_types
        resources :prototype_properties

        namespace :changes do
          resources :products do
            # resource :property,          only: [:edit, :update]
          end
        end

        namespace :multi do
          resources :products do
            resource :variant, only: [:edit, :update]
          end
        end
        resources :products do
          member do
            get :add_properties
            put :activate
          end
          resources :variants
        end
        namespace :products do
          resources :descriptions, only: [:edit, :update]
        end
      end
    end

  end
end