SOURCE_DIR=$HOME/Documents/nfs
case ${1} in
"qemu")
	WORK_DIR="$SOURCE_DIR/qemu-2.8.0"
;;

"cuju")
	WORK_DIR="$SOURCE_DIR/Cuju"
;;

*)
	echo "Usage ${0} {qemu|cuju}"
;;
esac
cd $WORK_DIR

#sudo gdb -ex 'set confirm off' \
#	--args $WORK_DIR/x86_64-softmmu/qemu-system-x86_64 \
sudo $WORK_DIR/x86_64-softmmu/qemu-system-x86_64 \
	-drive if=none,id=drive2,cache=none,format=raw,file=$SOURCE_DIR/VM2.img \
	-device virtio-blk,drive=drive2,scsi=off \
	-m 512M \
	-enable-kvm \
	-net tap,ifname=tap22 \
	-net nic,model=virtio,vlan=0,macaddr=ae:ae:00:00:00:26 \
	-vga std \
	-chardev socket,id=mon2,path=$HOME/vm2r.monitor,server,nowait \
	-mon chardev=mon2,id=monitor2,mode=readline \
	-incoming tcp:0:4441,ft_mode
