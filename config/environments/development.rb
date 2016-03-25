Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Do not compress assets
  config.assets.compress = false

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  # Raises error for missing translations
  config.action_view.raise_on_missing_translations = true
  PUBLISHABLE_KEY='pk_test_6pRNASCoBOKtIshFeQd4XMUh'
  SECRET_KEY='sk_test_BQokikJOvBiI2HlWgH4olfQ2'


  # Show full error reports and disable caching
  config.consider_all_requests_local       = true
  #config.action_view.debug_rjs             = true
  config.action_controller.perform_caching = true

  # Don't care if the mailer can't send
  config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger
  config.active_support.deprecation = :log

  # Only use best-standards-support built into browsers
  config.action_dispatch.best_standards_support = :builtin

  # config.cache_store = :memory_store

  config.cache_store = :dalli_store
  #config.cache_store = :redis_store
  # Don't care if the mailer can't send
  config.action_mailer.raise_delivery_errors = false
  config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }


  config.after_initialize do
    #Formtastic::SemanticFormBuilder.send(:include, Formtastic::DatePicker)
    #Formtastic::SemanticFormBuilder.send(:include, Formtastic::FuturePicker)
    #Formtastic::SemanticFormBuilder.send(:include, Formtastic::YearPicker)

    # ActiveMerchant::Billing::Base.mode = :test
    # ::GATEWAY = ActiveMerchant::Billing::AuthorizeNetGateway.new(
    #     :login    => Settings.authnet.login,
    #     :password => Settings.authnet.password,
    #     :test     => true   #  Make sure this is pointing to the authnet test server.  This needs to be uncommented to test capturing a payment.
    # )
    #::GATEWAY = ActiveMerchant::Billing::PaypalGateway.new(
    #  :login      => Settings.paypal.login,
    #  :password   => Settings.paypal.password,
    #  :signature  => Settings.paypal.signature
    #)


    #
    #    ::CIM_GATEWAY = ActiveMerchant::Billing::AuthorizeNetCimGateway.new(
    #      :login    => Settings.authnet.login,
    #      :password => Settings.authnet.password,
    #      :test     => true   #  Make sure this is pointing to the authnet test server.  This needs to be uncommented to test capturing a payment.
    #    )
    #::GATEWAY = ActiveMerchant::Billing::BraintreeGateway.new(
    #  :login     => Settings.braintree.login,
    #  :password  => Settings.braintree.password
    #)
  end

  PAPERCLIP_STORAGE_OPTS = {  :styles => {:mini => '48x48>',
                                          :small    => '100x100>',
                                          :medium   => '200x200>',
                                          :product  => '320x320>',
                                          :large    => '600x600>' },
                              :default_style => :product,
                              :url => "/assets/products/:id/:style/:basename.:extension",
                              :path => ":rails_root/public/assets/products/:id/:style/:basename.:extension" }

  config.log_level = :debug # In any environment initializer, or
  # Rails.logger.level = 0 # at any time

  # config.after_initialize do
  #   Bullet.enable = true
  #   Bullet.alert = true
  #   Bullet.bullet_logger = true
  #   Bullet.console = true
  # end

end
