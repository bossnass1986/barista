source 'https://rubygems.org'

# Deployment
gem 'rails', '4.2.4'

# ==========
# MemCachier
# ==========
# We recommend kgio for better performance.
gem 'kgio'
gem 'memcachier'
gem 'dalli'


# Server
gem 'puma'

# Template Engine
gem 'material_design_lite-sass'
gem 'haml'
gem 'html2haml'
gem 'friendly_id', '~> 5.1.0' # Note: You MUST use 5.0.0 or greater for Rails 4.0+
gem 'kaminari'

# Database
gem 'pg'

# User Management
gem 'devise'
gem 'rolify'
gem 'cancancan'

# Payment Gateway
# gem 'stripe'
gem 'braintree'
gem 'activemerchant', '~> 1.48'#, :lib => 'active_merchant'
gem 'aasm'

# Search
gem 'pg_search'

# Phone Management
gem 'twilio-ruby'

gem 'rails_12factor', group: :production
# gem 'seed_dump'

gem 'brakeman', :require => false

gem 'geocoder'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

#
# group :test do
#   gem 'rspec-rails'
#   gem 'cucumber-rails'
#   gem 'capybara'
#   gem 'database_cleaner'
#   gem 'test-unit', '~> 3.0'
# end

group :development do
  gem 'rspec-rails'
  gem 'bullet'
  gem 'better_errors'
  gem 'binding_of_caller'
end

