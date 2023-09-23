source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.2'

gem 'json', '~> 2.6', '>= 2.6.3'
gem 'stripe', '~> 9.3'
gem 'mini_magick', '~> 4.12'
gem 'ranked-model', '~> 0.4.9'
gem 'dotenv-rails', '~> 2.8', '>= 2.8.1'
gem 'geocoder', '~> 1.8', '>= 1.8.2'
gem 'fog-aws', '~> 3.19'
gem 'figaro', '~> 1.2'
gem 'carrierwave', '~> 3.0', '>= 3.0.3'
gem 'simple_form', '~> 5.2'
gem 'devise', '~> 4.9', '>= 4.9.2'
gem 'sprockets-rails', '~> 3.4', '>= 3.4.2', :require => 'sprockets/railtie'
gem 'jquery-rails', '~> 4.6'
gem 'bootstrap', '~> 5.3.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 7.0.8'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 4.3', '>= 4.3.3'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 5.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5.2', '>= 5.2.1'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.11', '>= 2.11.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1', '>= 3.1.19'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '~> 1.16', require: false

group :development, :test do
  gem 'rspec-rails', '~> 6.0', '>= 6.0.3'
  gem 'factory_bot_rails', '~> 6.2'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', '~> 11.1', '>= 11.1.3', platforms: [:mri, :mingw, :x64_mingw]
end


group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'rspec-rails', '~> 6.0', '>= 6.0.3'
  gem 'factory_bot_rails', '~> 6.2'
  gem 'web-console', '~> 4.2', '>= 4.2.1'
  gem 'listen', '~> 3.8'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring', '~> 4.1', '>= 4.1.1', group: :development
  gem 'spring-watcher-listen', '~> 2.1'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 3.39', '>= 3.39.2'
  gem 'selenium-webdriver', '~> 4.12'
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'chromedriver2-helper', '~> 0.0.10'
end

group :production do
  gem 'rails_12factor', '~> 0.0.3'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', '~> 1.2023', '>= 1.2023.3', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
