set :application, 'nairobi dev school'
set :repo_url, 'git@github.com:jetaggart/nairobi-dev-school.git '

ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

set :deploy_to, "/home/deploy/nds"
set :scm, :git
set :branch, 'master'

set :format, :pretty
set :log_level, :debug

# set :default_environment, { path: "/opt/ruby/bin:$PATH" }
set :keep_releases, 5
