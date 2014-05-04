directory "/home/bae/app"

workers 0
threads 16,16
bind "unix:///home/bae/app/tmp/puma.sock?mask=0777"
pidfile "/home/bae/app/tmp/puma.pid"
state_path "/home/bae/app/tmp/puma.state"

preload_app!

on_worker_boot do
  ActiveRecord::Base.connection.reconnect!
end
