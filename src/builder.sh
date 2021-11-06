#!/bin/sh

echo "Creating building directory"
mkdir build
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
sudo mkfs.ext4 -L boot ${LOOP}p1
sudo mkfs.ext4 -L root ${LOOP}p2
sudo mkswap ${LOOP}p5

mkdir -pv ${LFS}
sudo mount ${LOOP}p2 ${LFS}
sudo chmod -R 777 ${LFS}
mkdir ${LFS}/boot
sudo mount ${LOOP}p1 ${LFS}/boot
sudo chmod -R 777 ${LFS}

#sudo losetup -d ${LOOP}
