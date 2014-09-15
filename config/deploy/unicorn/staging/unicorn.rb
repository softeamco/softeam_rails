app = "testapp"
user = "user"
root = "/home/#{user}/#{app}/current"
working_directory root
pid "#{root}/tmp/pids/unicorn.pid"
stderr_path "#{root}/log/unicorn.log"
stdout_path "#{root}/log/unicorn.log"

listen "/home/#{user}/#{app}/shared/unicorn.sock"
# listen socket_file, :backlog => 1024
worker_processes 2
timeout 30
