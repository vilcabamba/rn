source 'https://rubygems.org'
ruby "2.1.4"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.0'
# Use postgresql as the database for Active Record
gem 'pg'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

gem "slim-rails"
gem "devise"
gem "decent_exposure"
gem "little_decorator"
gem "money-rails"
gem "breadcrumbs_on_rails"
gem "dotenv-rails", "~> 2.0.2"
gem "countries"
gem "kaminari"
gem "autoprefixer-rails"
gem "carrierwave"
gem "premailer-rails"
gem "nokogiri"
gem "sucker_punch"
gem "omniauth-twitter"
gem "omniauth-facebook"

gem "airbrake"

group :development, :test do
  gem 'pry'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  gem "annotate"

  # deployment
  gem "capistrano-rails", "~> 1.1"
  gem "capistrano-rbenv", "~> 2.0"
  gem "slackistrano", require: false
end

group :heroku do
  gem "rails_12factor"
  gem "puma"
end
