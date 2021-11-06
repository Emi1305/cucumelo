#!/bin/sh

sudo umount mnt/lfs/boot
sudo umount mnt/lfs
sudo losetup -d /dev/loop0
rm -fR build
rm -fR mnt
