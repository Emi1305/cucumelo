#!/bin/sh

echo "Creating image cucumelo.img"
truncate -s 24G build/builder.img

echo "Creating partitions"
echo "g
n
1

+200M
n
2

+20G
n
5


t
5
19
w
" | fdisk build/builder.img

echo "Setting up the device"
LOOP=$(sudo losetup --partscan --show --find build/builder.img)
echo "Setup on ${LOOP}"
sudo mkfs.ext4 -L boot /dev/loop0p1
sudo mkfs.ext4 -L root /dev/loop0p2
sudo mkswap /dev/loop0p5
sudo losetup -d ${LOOP}
