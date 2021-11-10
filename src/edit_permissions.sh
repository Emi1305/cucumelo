#!/bin/sh

read -n 1 -p "We need root permissions to change permissions"
sudo chown -R root:root ${TGTFS}
sudo umount ${TGTFS}/boot ${TGTFS}
sudo losetup -d ${LOOP}
