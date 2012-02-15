source 'http://rubygems.org'

gem "rails", "3.2.1"

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
  gem 'therubyracer'
end

gem 'jquery-rails'

gem 'bcrypt-ruby', '~> 3.0.0'

gem 'cancan'
gem 'ancestry'
gem 'decent_exposure'
gem "simple_form"
gem 'rdiscount', :require => 'rdiscount'
gem 'css3buttons'
gem 'fog'
gem 'carrierwave'

gem 'ancestry'
gem 'acts_as_list'

#gem 'twitter-bootstrap-rails'


gem 'unicorn'


group :production do
  gem 'pg'
  gem 'thin'
end

group :test, :development do
  gem 'rspec-rails'
  gem 'yaml_db'
  gem 'capistrano'
  gem 'mysql2'
  gem 'lorem'
  gem 'newrelic_rpm'
  gem 'sqlite3'
#  gem 'mongrel', '1.2.0.pre2'
end

group :test do
  gem 'sqlite3'
  gem 'factory_girl_rails'
  gem 'database_cleaner'
  gem 'turn', require: false
  gem "cucumber-rails", ">= 1.0.2"
  gem "spork", "> 0.9.0.rc"
  gem "guard-spork"
  gem "capybara", ">= 1.0.1"
  gem 'ruby-debug19', :require => 'ruby-debug'
end

