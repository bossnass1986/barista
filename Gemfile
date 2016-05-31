source 'https://rubygems.org'

# Deployment
gem 'rails'
ruby '2.3.1'
gem 'responders'

gem 'activemerchant', '~> 1.48'
# ==========
# MemCachier
# ==========
# We recommend kgio for better performance.
gem 'kgio'
gem 'memcachier'
gem 'dalli'


# Server
gem 'puma'

# Template
gem 'material_design_lite-sass'
gem 'angularjs-rails'
gem 'rails-angular-material'
gem 'haml'
gem 'html2haml'
gem 'friendly_id', '~> 5.1.0' # Note: You MUST use 5.0.0 or greater for Rails 4.0+
gem 'kaminari'

# Database
gem 'pg'

# User Management
gem 'clearance'
gem 'rolify'

# Payment Gateway
gem 'awesome_nested_set', '~> 3.0.1'
gem 'braintree'
gem 'aasm'
gem 'paperclip'

# Search
gem 'pg_search'

# Phone Management
gem 'sinch_sms'

# Geocoding
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
  gem 'rack-wwwhisper', '~> 1.0'
end