sudo echo "migrate_set_capability cuju-ft on" | sudo nc -U $HOME/vm2.monitor
sudo echo "migrate -c tcp:127.0.0.1:4441" | sudo nc -U $HOME/vm2.monitor
