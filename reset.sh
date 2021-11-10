#!/bin/sh

sudo umount wdir/lfs/boot
sudo umount wdir/lfs
sudo losetup -d /dev/loop0
rm -fR build
rm -fR wdir
