source "https://rubygems.org"

gem "capistrano"
gem "daemons"
gem "debugger"
gem "delayed_job_active_record"
gem "haml-rails"
gem "jquery-rails"
gem "pg"
gem "rails", "3.2.8"
gem "rvm-capistrano"
gem "thin"
gem "typhoeus"
gem "wirble"

group :development, :test do
  gem "factory_girl_rails", git: "git@github.com:jonesdeini/factory_girl_rails.git"
  gem "guard-minitest",              "~> 0.5.0"
  gem "guard-spork",                 "~> 1.2.1"
  gem "guard-spork-minitest", git: "git@github.com:jonesdeini/guard-spork-minitest.git"
  # gem "guard-spork-minitest", path: "~/guard-spork-minitest"
  gem "minitest-matchers",           "~> 1.2.0"
  gem "minitest-rails",              "~> 0.2.0"
  gem "minitest-rails-capybara",     "~> 0.1.0"
  gem "nyancat-test", git: "git://github.com/jonesdeini/nyancat-test.git"
  # gem "poltergiest"
  gem "shoulda-matchers",            "~> 1.2.0"
  gem "spork-rails", git: "git@github.com:jonesdeini/spork-rails.git"

  # TODO be fancy
  # for OSX
  # gem "rb-fsevent",                  "~> 0.9.1"
  # for linux
  gem "rb-inotify",                  "~> 0.8.8"
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem "sass-rails",   "~> 3.2.3"
  gem "coffee-rails", "~> 3.2.1"
  gem "therubyracer", :platforms => :ruby
  gem "uglifier", ">= 1.0.3"
end

# To use ActiveModel has_secure_password
# gem "bcrypt-ruby", "~> 3.0.0"

# To use Jbuilder templates for JSON
# gem "jbuilder"
