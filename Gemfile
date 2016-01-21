source 'https://rubygems.org'
ruby "2.2.2"
#gem 'rename'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.3'
# Use postgresql as the database for Active Record
gem 'pg'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
gem 'spring',        group: :development

# Use thoughtbot SCSS helpers
gem 'bourbon'
gem 'neat'
gem 'bitters'

# Start server with foreman and load .env file
gem 'foreman'

# serve with Puma, because I like it
gem 'puma'

#Amazon Web Services
gem 'aws-sdk', '< 2.0'

# Simple file attatchments
gem "paperclip", "~> 4.2"

# Oauth stuff, e.g. Google Apps and Facebook
gem 'omniauth'
gem 'omniauth-google-oauth2'

# haml for views
gem "haml-rails"

# enable heroku best-practices
group :production do
  gem 'rails_12factor'
  gem "rack-timeout-puma"
end

# rails_admin for CRMish stuff
gem 'rails_admin'

#error monitoring
gem 'raygun4ruby'

# Groups records by date, which we use for preparing graph data
gem 'groupdate'

# Geocode locations
gem 'geocoder'

#caching on heroku
gem 'dalli'
gem 'memcachier'

# ejs javascript templates
gem 'ejs'

# pagination
gem 'kaminari'

# markdown!
gem 'redcarpet'

# upload directly to S3
gem 's3_direct_upload'

# process things in the background
gem 'delayed_job_active_record'

# cleaner scope syntax
gem "has_scope"

# hashtags!
gem 'simple_hashtag'

group :development, :test do
  gem 'rspec-rails', '~> 3.0.0'
  gem 'dotenv-rails'
  gem 'bullet'
end

group :test do
  gem 'pry'
  gem 'capybara'
  gem 'capybara-webkit'
  gem 'launchy'
end
