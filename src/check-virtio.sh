echo "Checking for VirtIO"
if (grep -r -q -E "(QEMU|VirtualBox)" /sys/devices/virtual/dmi/id/); then
  echo "VirtIO hypervisor detected"
  exit 0
else
  echo "*No* VirtIO hypervisor detected"
  exit 1
fi

echo -n "Loading module 9pnet -> "
if [ `/sbin/lsmod |grep -i 9pnet|wc -l` -eq 1 ] ; then
        echo "Module 9pnet loaded succesfully"
        else echo "Module 9pnet is not loaded "
fi