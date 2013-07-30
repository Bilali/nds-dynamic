require "bundler/capistrano"

set :rvm_ruby_string, '2.0.0-p247'
set :rvm_type, :system

require "rvm/capistrano" # Load RVM's capistrano plugin.

server "37.139.15.190", :web, :app, :db, primary: true

set :application, "nds"
set :user, "rails"
set :deploy_to, "/home/#{user}/#{application}"
set :deploy_via, :remote_cache
set :use_sudo, false

set :scm, "git"
set :repository, "git@github.com:jetaggart/nairobi-dev-school.git"
set :branch, "master"

default_run_options[:pty] = true
ssh_options[:forward_agent] = true

after "deploy", "deploy:cleanup" # keep only the last 5 releases

