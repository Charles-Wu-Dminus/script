SOURCE_DIR=$HOME/Documents/nfs/Cuju

case ${1} in

"qemu")	
	sudo rmmod kvm_intel	&& echo "rm kvm_intel OK"
	sudo rmmod kvm		&& echo "rm kvm       OK"
	sudo modprobe kvm	&& echo "insert kvm_intel OK"
	sudo modprobe kvm_intel	&& echo "insert kvm       OK"
	lsmod | grep kvm
;;

"cuju")
	cd $SOURCE_DIR/kvm
	pwd
	sudo rmmod kvm_intel	&& echo "rm kvm_intel OK"
	sudo rmmod kvm		&& echo "rm kvm       OK"
	sudo insmod ./x86/kvm.ko	&& echo "insert kvm_intel OK"
	sudo insmod ./x86/kvm-intel.ko	&& echo "insert kvm       OK"
	lsmod | grep kvm
;;

*)
	echo "Usage ${0} {qemu|cuju}"
;;

esac
