set :ssh_options, { :forward_agent => true }
set :use_sudo, false

require "capistrano-unicorn"
after 'deploy:restart', 'unicorn:restart'  # app preloaded

require "rvm/capistrano"
set :rvm_ruby_string, "2.0.0"
set :rvm_type, :user

require "bundler/capistrano"
set :bundle_without,  [:development, :test]

set :user, "deploy"
set :application, "nds"
set :repository,  "git@github.com:jetaggart/nairobi-dev-school.git"
set :deploy_via, :remote_cache

set :scm, :git
set :branch, "master"

role :web, "37.139.15.190"                          # Your HTTP server, Apache/etc
role :app, "37.139.15.190"                          # This may be the same as your `Web` server
role :db,  "37.139.15.190", :primary => true # This is where Rails migrations will run

set :deploy_to, "/home/deploy/nds"
set :rails_env, "production"

namespace :deploy do
  desc "Execute migrations"
  task :migrate, :roles => :db do
    run "cd #{release_path} && RAILS_ENV=#{rails_env} bundle exec rake db:migrate"
  end
end

after 'deploy:update_code', 'deploy:migrate'
