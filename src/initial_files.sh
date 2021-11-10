#!/bin/sh

# /proc/mounts -> /etc/mtab
ln -sf ../proc/mounts ${TGTFS}/etc/mtab

# /etc/passwd
cat << EOF > ${TGTFS}/etc/passwd
root::x:0:0:root:/root:/bin/ash
bin:x:1:1:bin:/bin:/bin/false
daemon:x:2:6:daemon:/sbin:/bin/false
adm:x:3:16:adm:/var/adm:/bin/false
lp:x:10:9:lp:/var/spool/lp:/bin/false
mail:x:30:30:mail:/var/mail:/bin/false
news:x:31:31:news:/var/spool/news:/bin/false
uucp:x:32:32:uucp:/var/spool/uucp:/bin/false
postmaster:x:51:30:postmaster:/var/spool/mail:/bin/false
nobody:x:65534:65534:nobody:/:/bin/false
EOF

# /etc/group
cat << EOF > ${TGTFS}/etc/group
root:x:0:
bin:x:1:
sys:x:2:
kmem:x:3:
tty:x:4:
tape:x:5:
daemon:x:6:
floppy:x:7:
disk:x:8:
lp:x:9:
dialout:x:10:
audio:x:11:
video:x:12:
utmp:x:13:
usb:x:14:
cdrom:x:15:
adm:x:16:root,adm,daemon
console:x:17:
cdrw:x:18:
mail:x:30:mail
news:x:31:news
uucp:x:32:uucp
users:x:100:
nogroup:x:65533:
nobody:x:65534:
EOF

# libgcc
cp ${TOOLS}/${LFS_TGT}/lib/libgcc_s.so.1 ${TGTFS}/lib/
# Options strip
# ${TOOLS}/bin/${LFS_TGT}-strip ${TGTFS}/lib/libgcc_s.so.1

pushd ${SOURCES}

echo $PATH
echo "Installing libc"
MUSL_VER="1.1.16"
pushd musl-${MUSL_VER}
make distclean
./configure \
    CROSS_COMPILE=${LFS_TGT}- \
    --prefix=/ \
    --disable-static \
    --target=${LFS_TGT}
make -j${JOBS} &&
DESTDIR=${TGTFS} make install-libs
#read -n 1 -p "Musl installed"
popd



echo "Installing busybox"
BUSYBOX_VER="1.34.1"
tar -xjf busybox-${BUSYBOX_VER}.tar.bz2
pushd busybox-${BUSYBOX_VER}
make mrproper
make ARCH="${LFS_ARCH}" defconfig
sed -i 's/\(CONFIG_\)\(.*\)\(INETD\)\(.*\)=y/# \1\2\3\4 is not set/g' .config
sed -i 's/\(CONFIG_IFPLUGD\)=y/# \1 is not set/g' .config
sed -i 's/\(CONFIG_FEATURE_WTMP\)=y/# \1 is not set/g' .config
sed -i 's/\(CONFIG_FEATURE_UTMP\)=y/# \1 is not set/g' .config
sed -i 's/\(CONFIG_UDPSVD\)=y/# \1 is not set/g' .config
sed -i 's/\(CONFIG_TCPSVD\)=y/# \1 is not set/g' .config
make ARCH="${LFS_ARCH}" CROSS_COMPILE="${LFS_TGT}-" -j${JOBS} &&
make ARCH="${LFS_ARCH}" \
    CROSS_COMPILE="${LFS_TGT}-" \
    CONFIG_PREFIX="${TGTFS}" install
# For kernel with modules
cp examples/depmod.pl ${TOOLS}/bin/ 
chmod 755 ${TOOLS}/bin/depmod.pl
#read -n 1 -p "Busybox installed"
popd



echo "Installing iana-etc"
IANA_VER="2.30"
tar -xjf iana-etc-${IANA_VER}.tar.bz2
pushd iana-etc-${IANA_VER}
make get 
make distclean
make STRIP=yes -j${JOBS} 
make DESTDIR=${TGTFS} install
#read -n 1 -p "iana-etc installed"
popd



popd
