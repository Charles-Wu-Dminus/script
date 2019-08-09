a=$HOME/Documents/nfs/vhost_after

sudo rmmod kvm_intel	&& echo "rm kvm_intel OK"
sudo rmmod kvm		&& echo "rm kvm       OK"
sudo rmmod vhost_net.ko		&&	echo 'rm vhost_net.ko		OK'
sudo rmmod cuju_module.ko	&&	echo 'rm cuju_module.ko         OK'
sudo rmmod vhost.ko		&&	echo 'rm vhost.ko		OK'
sudo rmmod macvtap.ko		&&	echo 'rm macvtap.ko		OK'
sudo rmmod macvlan.ko		&&	echo 'rm macvlan.ko   		OK'
sudo rmmod tun.ko		&&	echo 'rm tun.ko       		OK'

sudo insmod $a/tun.ko			&& 	echo 'add tun.ko 	   OK'
sudo insmod $a/macvlan.ko		&& 	echo 'add macvlan.ko 	   OK'
sudo insmod $a/macvtap.ko		&& 	echo 'add macvtap	   OK'
sudo insmod $a/vhost.ko			&& 	echo 'add vhost.ko 	   OK'
sudo insmod $a/cuju_module.ko		&&	echo 'add cuju_module.ko   OK'
sudo insmod $a/vhost_net.ko experimental_zcopytx=1 &&	echo 'add vhost_net.ko OK'
cat /sys/module/vhost_net/parameters/experimental_zcopytx
