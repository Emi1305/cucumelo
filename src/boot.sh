#!/bin/sh

cat > ${TGTFS}/etc/fstab << EOF
#   file-system   mount-point   type    options dump    fsck
EOF

pushd ${SOURCES}
# Kernel
KERNEL_VER=5.13.12
pushd linux-${KERNEL_VER}
make mrproper
#make ARCH=${LFS_ARCH} CROSS_COMPILE=${LFS_TGT}- menuconfig
make ARCH=${LFS_ARM_ARCH} CROSS_COMPILE=${LFS_TGT}- defconfig
sed -i 's/# \(CONFIG_UEVENT_HELPER\) is not set/\1=y/g' .config
make ARCH=${LFS_ARM_ARCH} CROSS_COMPILE=${LFS_TGT}- -j${JOBS}
make ARCH=${LFS_ARM_ARCH} CROSS_COMPILE=${LFS_TGT}- INSTALL_MOD_PATH=${TGTFS} modules_install
#read -n 1 -p "Kernel installed"
cp arch/arm64/boot/Image ${TGTFS}/boot/cucumelo-${KERNEL_VER}
cp System.map ${TGTFS}/boot/System.map-${KERNEL_VER}
cp .config ${TGTFS}/boot/config-${KERNEL_VER}
install -d ${TGTFS}/usr/share/doc/linux-${KERNEL_VER}
cp -r Documentation/* ${TGTFS}/usr/share/doc/linux-${KERNEL_VER}
cp arch/arm64/boot/dts/broadcom/bcm2837-rpi-3-b.dtb ${TGTFS}/boot/
# Backup our kernel and dtb to our working directory
cp arch/arm64/boot/dts/broadcom/bcm2837-rpi-3-b.dtb ${LFS}/bcm2837-rpi-3-b.dtb
cp arch/arm64/boot/Image ${LFS}/cucumelo-${KERNEL_VER}
popd


# U-Boot
echo "Downloading U-Boot"
git clone https://source.denx.de/u-boot/u-boot.git
pushd u-boot
UBOOT_RELEASE=v2021.10-rc5
git checkout ${UBOOT_RELEASE}
make CROSS_COMPILE=${LFS_TGT}- rpi_3_defconfig
#make ARCH=arm64 CROSS_COMPILE=${LFS_TGT}- -j
make CROSS_COMPILE=${LFS_TGT}- -j${JOBS}
#read -n 1 -p "UBoot installed"
cp u-boot.bin ${TGTFS}/boot/kernel.img
popd

tar xzf bootscripts.tar.gz
pushd bootscripts-embedded-master
make DESTDIR=${TGTFS} install-bootscripts
popd


popd
