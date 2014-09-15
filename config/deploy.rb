require 'capistrano/ext/multistage'
require "bundler/capistrano"
# require 'capistrano/sidekiq'

set :stages, %w(staging production)
set :default_stage, "staging"
set :pty, false

after "deploy", "deploy:cleanup" # keep only the last 5 releases

# task :add_default_hooks do
#   after 'deploy:starting', 'sidekiq:quiet'
#   after 'deploy:updated', 'sidekiq:stop'
#   after 'deploy:reverted', 'sidekiq:stop'
#   after 'deploy:published', 'sidekiq:start'
# end
