#!/bin/sh
qemu-system-aarch64 -M raspi3 -append "rw earlyprintk loglevel=8 console=ttyAMA0,115200 dwc_otg.lpm_enable=0 root=/dev/mmcblk0p2 rootdelay=1" -sd build/cucumelo.img -kernel wdir/cucumelo-5.13.12 -dtb ./wdir/bcm2837-rpi-3-b.dtb -m 1G -smp 4 -serial stdio -usb -device usb-mouse -device usb-kbd
