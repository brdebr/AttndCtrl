source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.6'
# Use PostgreSQL as the database for Active Record
gem 'pg'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'
# Use Devise for login/out managment in the background
gem 'devise', '~> 4.4'
# Use this gem instead of the required inside IMS-LT
gem 'oauth', '~> 0.5.1'
# Use IMS-LTI gem to handle various operations, like Oauth
gem 'ims-lti', '~> 2.2', '>= 2.2.3'

gem 'wdm', '>= 0.1.0', platforms: [ :mingw, :x64_mingw]

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Bootstrap 4 Theme
gem 'bootstrap', '~> 4.0.0'
# Fonts and icons, awesome but not that much
gem 'font-awesome-sass', '~> 5.0.13'
# Use this as the calendar plugin that will be used to manage TimetableUnits
gem 'fullcalendar-rails'
# Use this because fullcalendar requires it, but its really usefull to manage date/time data
gem 'momentjs-rails'
# Format querys as table for easier debugging using the console
gem 'hirb'
# Use this gem to load data from rails into Ruby.
gem 'gon', '~> 6.2'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]

  #--> Testing gems

  # Main gem that bundles a lot of testing features,
  # besides this gem I'll add a bunch of usefull testing tools
  gem 'rspec-rails', '~> 3.7'

  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'

  # Use this to have a bunch of usefull tools for when things go wrong, because they will.
  gem 'better_errors', '~> 2.4'
  gem "binding_of_caller"

  # Use this to generate random data, have lots of useful methods.
  gem 'ffaker', '~> 2.2'
  # Use this to create objects with random parameters easily, combined with ffaker
  gem 'factory_bot_rails'
  # Use this gem to clean database between tests to avoid duplicate issues
  gem "database_cleaner"
  # Use this gem to autmatically launch the saved page copy resulting of the method 'save_and_open_page'
  gem 'launchy'

  #<-- End Testing gems
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
