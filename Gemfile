source "https://rubygems.org"

gem "daemons"
gem "debugger"
gem "delayed_job_active_record"
gem "haml-rails"
gem "json",                          "~> 1.7.7"
gem "jquery-rails",                  "~> 2.1.4"
gem "pg"
gem "rails",                         "~> 3.2.13"
gem "typhoeus"
gem "unicorn",                       "~> 4.6.2"
gem "wirble"

gem "omniauth-openid"

group :development do
  gem 'capistrano',     '~> 2.14.2'
  gem 'capistrano-unicorn', :require => false
  gem 'rvm-capistrano', '~> 1.3.0'
end

group :development, :test do
  gem "minitest-rails",              "~> 0.9.1"
  gem "minitest-rails-capybara",     "~> 0.1.0"
  gem "nyancat-test",                git: "git://github.com/jonesdeini/nyancat-test.git"
  # gem "poltergiest"
  gem "turn"

  gem "rb-inotify",                  "~> 0.9.0"
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem "sass-rails",                  "~> 3.2.3"
  gem "coffee-rails",                "~> 3.2.1"
  gem "therubyracer",                :platforms => :ruby
  gem "uglifier",                    ">= 1.0.3"
end

# To use ActiveModel has_secure_password
# gem "bcrypt-ruby", "~> 3.0.0"

# To use Jbuilder templates for JSON
# gem "jbuilder"
