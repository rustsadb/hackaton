# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.4'

gem 'bcrypt', '~> 3.1.7'                    # Use Active Model has_secure_password
gem 'aasm'                                  # Library for adding finite state machines to Ruby classes
gem 'bootsnap', '>= 1.4.4', require: false
gem 'dotenv-rails'                          # Shim to load environment variables from .env into ENV in development.
gem 'dry-auto_inject'                       # Low-impact dependency injection and resolution support for classes
gem 'dry-struct'
gem 'dry-validation'                        # Validation library with type-safe schemas and rules
gem 'factory_bot_rails'
gem 'i18n'
gem 'jsonapi-serializer'                    # Pure Ruby readonly serializers for the JSON:API spec
gem 'jwt'                                   # Rails-API authentication solution based on JWT
gem 'kaminari'                              # Pagination
gem 'listen', '~> 3.3'                      # Listen file changes
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'rails', '~> 6.1.4', '>= 6.1.4.1'
gem 'redis'                                 # Use Redis adapter to run Action Cable in production
gem 'rspec'
gem 'rspec_api_documentation'
gem 'pry'                                   # Powerful alternative to the standard IRB shell for Ruby
gem 'rspec-rails'
gem 'rswag'
gem 'sidekiq'
gem 'sidekiq-scheduler'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'ffaker'
  gem 'rubocop-rails'
end

group :development do
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
