#!/bin/sh

unset CFLAGS
export LC_ALL=POSIX
export LFS=$(pwd)/mnt/lfs
export LFS_TGT=aarch64-rpi3-linux-musleabihf
export LFS_ARCH=aarch64
export LFS_ARM_ARCH=arm64
export LFS_FLOAT=hard #armv7-unknown-linux-musleabiHF
export LFS_FPU=vfp
export CONFIG_SITE=${LFS}/usr/share/config.site
export TOOLS=${LFS}/tools
export SOURCES=${LFS}/sources
export PATH=${TOOLS}/bin:$PATH
export JOBS=10

. src/builder.sh
. src/dependencies.sh
. src/verify_dependencies.sh
. src/generate_fs.sh
. src/toolchain.sh
. src/target_fs.sh
. src/initial_files.sh
. src/boot.sh
. src/boot_scripts.sh
