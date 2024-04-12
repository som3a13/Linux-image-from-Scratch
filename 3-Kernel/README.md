# Linux Kernel

The Linux Kernel is the core component of the Linux operating system. It is a Unix-like, monolithic kernel, meaning it operates as a single, large process in the system and handles all major tasks such as process management, memory management, device management, and file system handling.

# 1. Download & Configuration for kernel !

**for Vexpress Cortexa9  Qemu**

```
git clone --depth=1 git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
cd linux

export CROSS_COMPILE=<Path To the Compiler>/arm-cortexa9_neon-linux-musleabihf-
export ARCH=arm
make qemu_arm_vexpress_defconfig
```

**for Raspberry pi**

```
git clone --depth=1 https://github.com/raspberrypi/linux
cd linux
#export the compiler
export CROSS_COMPILE=arm-linux-gnueabihf-
#export the architecture used
export ARCH=arm<32/64>
#configure the kernel to rpi depends on the SoC number
make bcmXXXX_defconfig
```

**In the configuration, configure the following  requirement :**

```
make menuconfig
```

For all the next board this configuration must be checked

* [ ] Enable **devtmpfs**
* [ ] Change kernel compression to **XZ**
* [ ] Change your kernel local version to your name and append on it -v1.0

Now time to make :

```
make  -j12 zImage modules dtbs
```

# 2. kernel & dtb load in u-boot

Take output kernel and dtb and put then in your sd/boot/ or in TFTP server to load them

```
cp linux/arch/arm/boot/zImage /srv/tftp/
cp linux/arch/arm/boot/dts/*-ca9.dtb /srv/tftp/
```

**discussed that in U-boot** 

# 3. Start Kernel 

```
bootz $kernel_addr_r - $fdt_addr_r
```

# 4. Rootfs not found ?

Kernel Will **panic** and wont start as there's no rootfs to load . Check BusyBox section to know more about rootfs
