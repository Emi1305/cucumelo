#!/bin/sh

mkdir -p ${TGTFS}/bin
mkdir -p ${TGTFS}/boot
mkdir -p ${TGTFS}/dev
mkdir -p ${TGTFS}/etc
mkdir -p ${TGTFS}/home
mkdir -p ${TGTFS}/lib/firmware
mkdir -p ${TGTFS}/lib/modules
mkdir -p ${TGTFS}/mnt
mkdir -p ${TGTFS}/opt
mkdir -p ${TGTFS}/proc
mkdir -p ${TGTFS}/sbin
mkdir -p ${TGTFS}/srv
mkdir -p ${TGTFS}/sys
mkdir -p ${TGTFS}/var/cache
mkdir -p ${TGTFS}/var/lib
mkdir -p ${TGTFS}/var/local
mkdir -p ${TGTFS}/var/lock
mkdir -p ${TGTFS}/var/log
mkdir -p ${TGTFS}/var/opt
mkdir -p ${TGTFS}/var/run
mkdir -p ${TGTFS}/var/spool
mkdir -p ${TGTFS}/usr/bin
mkdir -p ${TGTFS}/usr/include
mkdir -p ${TGTFS}/usr/lib
mkdir -p ${TGTFS}/usr/sbin
mkdir -p ${TGTFS}/usr/share
mkdir -p ${TGTFS}/usr/src
mkdir -p ${TGTFS}/usr/local/bin
mkdir -p ${TGTFS}/usr/local/include
mkdir -p ${TGTFS}/usr/local/lib
mkdir -p ${TGTFS}/usr/local/sbin
mkdir -p ${TGTFS}/usr/local/share
mkdir -p ${TGTFS}/usr/local/src
install -d -m 0750 ${TGTFS}/root
install -d -m 1777 ${TGTFS}/tmp
install -d -m 1777 ${TGTFS}/var/tmp
