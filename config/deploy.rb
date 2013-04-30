require "bundler/capistrano"
require 'capistrano-unicorn'
require "delayed/recipes"
require "rvm/capistrano"
load "deploy/assets"

set :rvm_ruby_string, "ruby-2.0.0-p0@ICanHazSandvich"

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

set :rails_env, "production" #added for delayed job

ssh_options[:forward_agent] = true

namespace :configs do
  task :symlink do
    run "cp -R ~/shared/config/* #{release_path}/config/"
    run "ln -nfs #{shared_path}/assets #{release_path}/public/assets"
  end
end

before "deploy:setup", "rvm:install_ruby"

after "deploy:update_code", "deploy:migrate"

before "deploy:finalize_update", "configs:symlink"

after "deploy:restart", "deploy:cleanup"
after 'deploy:restart', 'unicorn:reload' # app IS NOT preloaded
after 'deploy:restart', 'unicorn:restart'  # app preloaded

after "deploy:stop",    "delayed_job:stop"
after "deploy:start",   "delayed_job:start"
after "deploy:restart", "delayed_job:restart"
