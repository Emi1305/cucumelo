#!/bin/sh

unset CFLAGS
export LC_ALL=POSIX
#export LFS_TGT=armv71-lfs-linux-gnu
export LFS=mnt/lfs
export TOOLS=$(realpath ${LFS}/tools)
export SOURCES=$(realpath ${LFS}/sources)
#export LFS_TGT=armv7-unknown-linux-gnueabihf
export LFS_TGT=armv8-unknown-linux-musleabihf
#export LFS_ARCH=arm
export LFS_ARCH=aarch64
export LFS_ARM_ARCH=armv8
export LFS_FLOAT=hard #armv7-unknown-linux-musleabiHF
export LFS_FPU=vfp
export CONFIG_SITE=${LFS}/usr/share/config.site
export PATH=$(realpath ${TOOLS}/bin):$PATH

. src/builder.sh
. src/dependencies.sh
. src/verify_dependencies.sh
. src/generate_fs.sh
. src/toolchain.sh
. src/target_fs.sh
. src/initial_files.sh
. src/boot.sh
