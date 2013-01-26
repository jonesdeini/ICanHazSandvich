require "bundler/capistrano"
require "delayed/recipes"
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

set :rails_env, "production" #added for delayed job

ssh_options[:forward_agent] = true

namespace :configs do
  task :symlink do
    run "cp -R ~/shared/config/* #{release_path}/config/"
    run "ln -nfs #{shared_path}/assets #{release_path}/public/assets"
  end
end

namespace :deploy do
  desc "start thin"
  task :start, roles: :app, except: { no_release: true } do
    run "cd #{current_path} && bundle exec thin start -C ./config/thin.yml"
  end

  desc "reload thin"
  task :reload, roles: :app, except: { no_release: true } do
    run "cd #{current_path} && bundle exec thin restart -C ./config/thin.yml"
  end

  desc "stop thin"
  task :stop, roles: :app, except: { no_release: true } do
    run "cd #{current_path} && bundle exec thin stop -C ./config/thin.yml"
  end

  desc "stop then start thin"
  task :restart, roles: :app, except: { no_release: true } do
    stop
    start
  end
end

before "deploy:setup", "rvm:install_ruby"

after "deploy:update_code", "deploy:migrate"

before "deploy:finalize_update", "configs:symlink"

after "deploy:restart", "deploy:cleanup"

after "deploy:stop",    "delayed_job:stop"
after "deploy:start",   "delayed_job:start"
after "deploy:restart", "delayed_job:restart"
