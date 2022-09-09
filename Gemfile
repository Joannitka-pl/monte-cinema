# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', '~> 6.1.3', '>= 6.1.3.2'
# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1'
# Use Puma as the app server
gem 'puma', '~> 5.0'

gem 'bootsnap', '>= 1.4.4', require: false
gem 'devise'
gem 'devise-jwt'
gem 'pundit'
gem 'pundit-matchers', '~> 1.4', '>= 1.4.1'
gem 'sentry-rails'
gem 'sentry-ruby'
gem 'sidekiq'
gem 'stripe', '~> 6.2'

# printing Ruby objects in a pretty way
gem 'awesome_print', '~> 1.9.2'

# qr code encoder
gem 'rqrcode', '~> 2.1.1'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails'
  gem 'rspec', '~> 3.5'
  gem 'rspec-rails', '~> 5.0.0'
  gem 'rubocop', '~> 1.26.0', require: false
  gem 'rubocop-rails', '~> 2.13.0', require: false
  gem 'rubocop-rspec', '~> 1.22.2'
  gem 'simplecov', require: false, group: :test
end

group :development do
  gem 'listen', '~> 3.3'
  gem 'spring'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
