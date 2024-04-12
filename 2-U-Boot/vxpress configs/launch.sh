qemu-system-arm -M vexpress-a9 \
-m 128M \
-nographic \
-kernel u-boot/u-boot \
-sd sd.img \
-net tap,script=qemu-ifup.sh \
-net nic \

