set :stage, :production

server '37.139.15.190', user: 'deploy', roles: %w{web app db}

set :rails_env, :production
