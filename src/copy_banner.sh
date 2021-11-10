#!/bin/sh

cp ${LFS}/../src/banner ${TGTFS}/etc/rc.d/init.d/banner
ln -s ../init.d/banner ${TGTFS}/etc/rc.d/start/banner
chmod 775 ${TGTFS}/etc/rc.d/init.d/banner
