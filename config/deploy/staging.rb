server "1.1.1.1", :web, :app, :db, primary: true
set :application, "testapp"
set :user, "staging"
set :deploy_to, "/home/#{user}/#{application}"
set :rails_env, 'staging'
set :deploy_via, :remote_cache
set :use_sudo, false
set :scm, :git
set :repository, "git@github.com:softeamco/#{application}.git"
set :branch, "develop"
set :domain, "#{user}@1.1.1.1"
set :shared_children, shared_children + %w{public/uploads}
ssh_options[:forward_agent] = true
default_run_options[:pty] = true

namespace :deploy do

  %w[start stop restart].each do |command|
    desc "#{command} unicorn server"
    task command, roles: :app, except: {no_release: true} do
      run "/etc/init.d/unicorn_#{application} #{command}"
    end
  end

  task :setup_config, roles: :app do
    sudo "ln -nfs #{current_path}/config/deploy/nginx/staging.conf /etc/nginx/sites-enabled/#{application}.conf"
    sudo "ln -nfs #{current_path}/config/deploy/unicorn/staging/unicorn_init.sh /etc/init.d/unicorn_#{application}"
  end
  after "deploy:setup", "deploy:setup_config"

  task :symlink_config, roles: :app do
    run "ln -nfs #{shared_path}/secret_token.rb #{release_path}/config/initializers/secret_token.rb"
    run "ln -nfs #{shared_path}/config/mongoid.yml #{release_path}/config/mongoid.yml"
  end
  after "deploy:finalize_update", "deploy:symlink_config"

  desc "Make sure local git is in sync with remote."
  task :check_revision, roles: :web do
    unless `git rev-parse HEAD` == `git rev-parse origin/develop`
      puts "WARNING: HEAD is not the same as origin/develop"
      puts "Run `git push` to sync changes."
      exit
    end
  end

  before "deploy", "deploy:check_revision"
end
