#!/bin/sh

echo "Creating building directory"
mkdir build
echo "Creating image cucumelo.img"
truncate -s 2G ${IMAGE}

echo "Creating partitions"
echo "g
n
1

+200M
n
2

+1600M
n
5


t
5
19
w
" | fdisk ${IMAGE}

echo "Setting up the device"
export LOOP=$(sudo losetup --partscan --show --find ${IMAGE})
echo "Setup on ${LOOP}"
sudo mkfs.ext4 -L boot ${LOOP}p1
sudo mkfs.ext4 -L root ${LOOP}p2
sudo mkswap ${LOOP}p5

mkdir -p ${TGTFS}
sudo mount ${LOOP}p2 ${TGTFS}
sudo chmod -R 777 ${TGTFS}
mkdir -p ${TGTFS}/boot
sudo mount ${LOOP}p1 ${TGTFS}/boot
sudo chmod -R 777 ${TGTFS}

#sudo losetup -d ${LOOP}
