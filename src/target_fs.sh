#!/bin/sh

mkdir -p ${LFS}/targetfs/bin
mkdir -p ${LFS}/targetfs/boot
mkdir -p ${LFS}/targetfs/dev
mkdir -p ${LFS}/targetfs/etc
mkdir -p ${LFS}/targetfs/home
mkdir -p ${LFS}/targetfs/lib/firmware
mkdir -p ${LFS}/targetfs/lib/modules
mkdir -p ${LFS}/targetfs/mnt
mkdir -p ${LFS}/targetfs/opt
mkdir -p ${LFS}/targetfs/proc
mkdir -p ${LFS}/targetfs/sbin
mkdir -p ${LFS}/targetfs/srv
mkdir -p ${LFS}/targetfs/sys
mkdir -p ${LFS}/targetfs/var/cache
mkdir -p ${LFS}/targetfs/var/lib
mkdir -p ${LFS}/targetfs/var/local
mkdir -p ${LFS}/targetfs/var/lock
mkdir -p ${LFS}/targetfs/var/log
mkdir -p ${LFS}/targetfs/var/opt
mkdir -p ${LFS}/targetfs/var/run
mkdir -p ${LFS}/targetfs/var/spool
mkdir -p ${LFS}/targetfs/usr/bin
mkdir -p ${LFS}/targetfs/usr/include
mkdir -p ${LFS}/targetfs/usr/lib
mkdir -p ${LFS}/targetfs/usr/sbin
mkdir -p ${LFS}/targetfs/usr/share
mkdir -p ${LFS}/targetfs/usr/src
mkdir -p ${LFS}/targetfs/usr/local/bin
mkdir -p ${LFS}/targetfs/usr/local/include
mkdir -p ${LFS}/targetfs/usr/local/lib
mkdir -p ${LFS}/targetfs/usr/local/sbin
mkdir -p ${LFS}/targetfs/usr/local/share
mkdir -p ${LFS}/targetfs/usr/local/src
install -d -m 0750 ${LFS}/targetfs/root
install -d -m 1777 ${LFS}/targetfs/tmp
install -d -m 1777 ${LFS}/targetfs/var/tmp
