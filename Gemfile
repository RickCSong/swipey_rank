source 'https://rubygems.org'
ruby '2.1.2'

gem 'rails', '4.1.4'
gem 'pg'
gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'

gem 'jquery-rails'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

gem 'thin'

gem 'bundler'

gem 'tzinfo-data'
gem 'validates_formatting_of'
gem 'bootstrap-sass', github: 'twbs/bootstrap-sass'
gem 'bootstrap-sass-extras'
gem 'binding_of_caller'

gem 'ember-rails'

group :development do
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'pry-rails'
  gem 'better_errors'

  gem 'capistrano'
  gem 'capistrano-rvm', '>= 0.1.0' # seems to really like 0.0.3
  gem 'capistrano-bundler'
  gem 'capistrano-rails'
end

group :test do
  gem 'shoulda-matchers'
  gem 'database_cleaner'
end

group :development, :test do
  gem 'faker'
  gem 'rspec-rails'
  gem 'factory_girl_rails'
end

group :production do
  gem 'rails_12factor'
end
