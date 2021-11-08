#!/bin/sh

cat > ${LFS}/targetfs/etc/fstab << EOF
#   file-system   mount-point   type    options dump    fsck
EOF

pushd ${SOURCES}
# Kernel
KERNEL_VER=5.13.12
pushd linux-${KERNEL_VER}
make mrproper
#make ARCH=${LFS_ARCH} CROSS_COMPILE=${LFS_TGT}- menuconfig
make ARCH=${LFS_ARM_ARCH} CROSS_COMPILE=${LFS_TGT}- defconfig
make ARCH=${LFS_ARM_ARCH} CROSS_COMPILE=${LFS_TGT}- -j${JOBS}
make ARCH=${LFS_ARM_ARCH} CROSS_COMPILE=${LFS_TGT}- INSTALL_MOD_PATH=${LFS}/targetfs modules_install
#read -n 1 -p "Kernel installed"
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
read -n 1 -p "UBoot installed"
popd

popd
