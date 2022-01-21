#!/bin/sh
function rmko()
{
        lsmod | grep -q $1
        if [ $? -eq 0 ]; then
                rmmod $1.ko
                echo "rmmod $1"
        fi
}

echo "reinstall VirtIO"
rmko virtio_scsi
rmko virtio_net
rmko virtio_blk
rmko virtio_pci
rmko virtio_mmio
rmko virtio_ring
rmko virtio

if (grep -r -q -E "(QEMU|VirtualBox)" /sys/devices/virtual/dmi/id/); then
	echo "VirtIO hypervisor detected"
	exit 0
else
	echo "*No* VirtIO hypervisor detected"
	exit 1
fi

#	echo "Loading module 9pnet -> "
#	if [ `/sbin/lsmod |grep -i 9pnet|wc -l` -eq 1 ] ; then
#			echo "Module 9pnet loaded succesfully"
#			else echo "Module 9pnet is not loaded "
#	fi

