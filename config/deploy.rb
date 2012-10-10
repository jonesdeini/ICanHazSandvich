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

namespace :configs do
  task :symlink do
    run "cp -R ~/shared/config/* #{release_path}/config/"
    run "ln -nfs #{shared_path}/assets #{release_path}/public/assets"
  end
end

before "deploy:setup", "rvm:install_ruby"

after "deploy:update_code", "deploy:migrate"

before "deploy:finalize_update", "configs:symlink"
# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"
