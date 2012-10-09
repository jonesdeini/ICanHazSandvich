source 'https://rubygems.org'

gem 'capistrano'
gem 'daemons'
gem 'debugger'
gem 'delayed_job_active_record'
gem 'haml-rails'
gem 'jquery-rails'
gem 'pg'
gem 'rails', '3.2.8'
gem 'rvm-capistrano'
gem 'typhoeus'
gem 'wirble'

group :development, :test do
  # if cas_test_toolkit is removed
  # gem 'factory_girl_rails', git: "git@github.com:jonesdeini/factory_girl_rails.git"
  # gem 'minitest-rails'
  gem 'minitest-rails-capybara'

  gem 'cas_test_toolkit', '0.0.4', git: 'git@github.com:Liaison-Intl/cas_test_toolkit.git'
  #gem 'cas_test_toolkit', '0.0.5', path: '~/cas_test_toolkit'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'therubyracer', :platforms => :ruby
  gem 'uglifier', '>= 1.0.3'
end

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'
