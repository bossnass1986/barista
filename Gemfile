source 'https://rubygems.org'

# Deployment
gem 'rails'
ruby '2.3.1'
gem 'skylight'
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
gem 'clearance'
# gem 'devise'
gem 'rolify'
gem 'cancancan'

# Payment Gateway
# gem 'stripe'
gem 'awesome_nested_set', '~> 3.0.1'
gem 'braintree'
gem 'activemerchant', '~> 1.48'#, :lib => 'active_merchant'
gem 'aasm'
gem 'paperclip'

# Search
gem 'pg_search'
# gem 'algoliasearch-rails'

# Phone Management
gem 'sinch_sms'
# gem 'twilio-ruby'
group :production do
  gem 'rails_12factor'
  gem 'rack-wwwhisper', '~> 1.0'
end
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

# group :development do
#   gem 'rspec-rails'
#   gem 'bullet'
#   gem 'better_errors'
#   gem 'binding_of_caller'
# end

group :development do
  gem 'quiet_assets'
  gem 'refills'
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'web-console'
end

group :development, :test do
  gem 'awesome_print'
  gem 'bullet'
  gem 'bundler-audit', '>= 0.5.0', require: false
  gem 'dotenv-rails'
  gem 'factory_girl_rails'
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'rspec-rails', '~> 3.4.0'
end

group :development, :staging do
  gem 'rack-mini-profiler', require: false
end
