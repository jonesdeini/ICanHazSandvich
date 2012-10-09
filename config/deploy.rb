require "bundler/capistrano"
require "rvm/capistrano"
load "deploy/assets"

set :rvm_ruby_string, "ruby-1.9.3-p194@ICanHazSandvich"

set :application, "ICanHazSandvich"
set :deploy_to, "/home/sandvich"

set :scm, :git
set :repository,  "git@github.com:jonesdeini/ICanHazSandvich.git"
set :branch, "master"

set :user, "sandvich"
set :use_sudo, false

set :location, "184.73.157.166"
role :web, location
role :app, location
role :db,  location, :primary => true # This is where Rails migrations will run

ssh_options[:forward_agent] = true

before "deploy:setup", "rvm:install_ruby"
# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"
