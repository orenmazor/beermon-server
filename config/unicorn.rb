port = ENV['PORT'].to_i
port = 3000 if port <= 0
worker_processes 1
timeout 30
preload_app true
listen port, :tcp_nopush => false