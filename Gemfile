source 'https://rubygems.org'

# Deployment
gem 'rails'
ruby '2.3.1'
gem 'responders'

# Server
gem 'puma'

# Analytics
gem 'intercom-rails'
gem 'ahoy_matey'

gem 'activemerchant', '~> 1.48'
# ==========
# MemCachier
# ==========
# We recommend kgio for better performance.
gem 'kgio'
gem 'memcachier'
gem 'dalli'
gem 'pry'

# Template
gem 'material_design_lite-sass'
gem 'angularjs-rails'
gem 'rails-angular-material'
gem 'haml'
gem 'slim-rails'
gem 'html2haml'
gem 'friendly_id', '~> 5.1.0' # Note: You MUST use 5.0.0 or greater for Rails 4.0+
gem 'kaminari'
gem 'gmaps4rails'
gem 'wicked'

# Database
gem 'pg'

# User Management
gem 'clearance'
gem 'rolify'
gem 'merit'
# gem 'access-granted', '~> 1.1.0'

# Payment Gateway
gem 'awesome_nested_set', '~> 3.0.1'
gem 'braintree'
gem 'aasm'

# Image Uploads
# gem 'paperclip'
gem 'aws-sdk', '~> 2.3'

# Search
gem 'pg_search'

# Communications Management
gem 'sinch_sms'
gem 'postmark-rails'

# Geocoding
gem 'geocoder'

# Assets
gem 'sass-rails'
gem 'coffee-rails'
# gem 'compass-rails'


gem 'uglifier', '>= 1.0.3'

gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'gmaps-autocomplete-rails'

# Admin
gem 'chartkick'

group :development do
  gem 'quiet_assets'
  gem 'refills'
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'web-console'
  gem 'brakeman', :require => false
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

group :production do
  gem 'rails_12factor'
  gem 'rack-cache'
  gem 'heroku-deflater'
end