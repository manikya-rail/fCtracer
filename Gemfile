# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.6'

gem 'actionpack-action_caching'
gem 'awesome_rails_console'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'faraday'
gem 'faraday_curl'
gem 'faraday_middleware'
gem 'figaro'
gem 'jbuilder', '~> 2.7'
gem 'pg'
gem 'puma', '~> 4.1'
gem 'rails', '~> 6.0.3', '>= 6.0.3.2'
gem 'redis-rack-cache'
gem 'rollbar'
gem 'sass-rails', '>= 6'
gem 'turbolinks', '~> 5'
gem 'webpacker', '~> 4.0'

group :development, :test do
  gem 'factory_bot_rails'
  gem 'hirb'
  gem 'hirb-unicode-steakknife', require: 'hirb-unicode'
  gem 'pry', '~> 0.12.2'
  gem 'pry-byebug', '~> 3.8.0'
  gem 'pry-stack_explorer', '~> 0.4.9'
  gem 'rubocop-rails'
end

group :development do
  gem 'browser_sync_rails'
  gem 'listen', '~> 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'rspec-rails'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

gem "roo", "~> 2.8"
