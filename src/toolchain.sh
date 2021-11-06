#!/bin/sh

# TOOLS=$(realpath ${LFS}/tools);
# SOURCES=$(realpath ${LFS}/sources);
SYSROOT=$(realpath ${LFS});
# export PATH=$TOOLS/bin:$PATH

mkdir -p ${TOOLS}/${LFS_TGT}
ln -sfv . ${TOOLS}/${LFS_TGT}/usr 
pushd ${SOURCES}

alias xz="tar -xJf";
alias bz="tar -xjf";
alias gz="tar -xzf";



# Linux headers
echo "Linux headers";
echo "Extracting";
ver="5.13.12";
xz linux-${ver}.tar.xz;
pushd linux-${ver};
echo "Making headers";
make mrproper;
#make ARCH=${LFS_ARCH} headers_check;
make ARCH=${LFS_ARCH} INSTALL_HDR_PATH=${TOOLS}/${LFS_TGT} headers_install;
echo "Done";
popd;



# Binutils
echo "Binutils"
ver="2.37"
xz binutils-${ver}.tar.xz
pushd binutils-${ver}
mkdir build
pushd build
../configure --prefix=${TOOLS} \
    --with-sysroot=${TOOLS}/${LFS_TGT} \
    --target=${LFS_TGT} \
    --disable-nls \
    --disable-multilib \
    --disable-werror 
make configure-host &&
make -j && 
make install 
echo "Done"
popd
popd

read -n 1 -p "Binutils done" i

# GCC
echo "GCC"
GCC_VER="11.2.0"
MPFR_VER="4.1.0"
GMP_VER="6.2.1"
MPC_VER="1.2.1"
GLIBC_VER="2.11"
echo "Extracting"
xz gcc-${GCC_VER}.tar.xz;
SRCDIR=$(realpath ./gcc-${GCC_VER});
pushd ${SRCDIR}
xz ../mpfr-${MPFR_VER}.tar.xz;
xz ../gmp-${GMP_VER}.tar.xz;
gz ../mpc-${MPC_VER}.tar.gz;

mv mpfr-${MPFR_VER} mpfr;
mv gmp-${GMP_VER} gmp;
mv mpc-${MPC_VER} mpc;
#case $(uname -m) in
#    x86_64)
#        sed -e '/m64=/s/lib64/lib/' \
#            -i.orig gcc/config/i386/t-linux64;
#                    
#        ;;
#esac
popd

echo "Configure";
mkdir gccbuilder;
pushd gccbuilder;
${SRCDIR}/configure --prefix=${TOOLS} \
    --host=$(uname -m)-pc-linux-gnu \
    --build=$(uname -m)-pc-linux-gnu \
    --target=${LFS_TGT} \
    --with-sysroot=${TOOLS}/${LFS_TGT} \
    --with-newlib \
    --without-headers \
    --enable-initfini-array \
    --disable-nls \
    --disable-shared \
    --disable-multilib \
    --disable-decimal-float \
    --disable-threads \
    --disable-libatomic \
    --disable-libgomp \
    --disable-libquadmath \
    --disable-libssp \
    --disable-libvtv \
    --disable-libstdcxx \
    --disable-libmudflap \
    --with-float=${LFS_FLOAT} \
    --enable-languages=c \
    --with-mpfr=${SRCDIR}/mpfr \
    --with-mpc=${SRCDIR}/mpc \
    --with-gmp=${SRCDIR}/gmp \
    --with-fpu=${LFS_FPU} \
    # --with-glibc-version=${GLIBC_VER} \
    # --with-arch=arm \
    # --with-mpfr-include=${SRCDIR}/mpfr/src \
    # --with-mpfr-lib=${SRCDIR}/mpfr/src/.libs \
make all-gcc all-target-libgcc &&
make install-gcc install-target-libgcc
echo "Done";
popd;

read -n 1 -p "GCC1 done" i

echo "musl"
echo "Extracting"
ver=1.1.16
gz musl-${ver}.tar.gz
pushd musl-${ver}
echo "Configuring"
./configure CROSS_COMPILE=${LFS_TGT}- \
    --prefix=/ \
    --target=${LFS_TGT} 
make &&
DESTDIR=${TOOLS}/${LFS_TGT} make install
popd
read -n 1 -p "musl done" i


echo "GCC Final"
GCC_VER="11.2.0"
MPFR_VER="4.1.0"
GMP_VER="6.2.1"
MPC_VER="1.2.1"
GLIBC_VER="2.11"
rm -fR gcc-${GCC_VER}
xz gcc-${GCC_VER}.tar.xz;
SRCDIR=$(realpath ./gcc-${GCC_VER});
pushd ${SRCDIR}
xz ../mpfr-${MPFR_VER}.tar.xz;
xz ../gmp-${GMP_VER}.tar.xz;
gz ../mpc-${MPC_VER}.tar.gz;

mv mpfr-${MPFR_VER} mpfr;
mv gmp-${GMP_VER} gmp;
mv mpc-${MPC_VER} mpc;
case $(uname -m) in
    x86_64)
        sed -e '/m64=/s/lib64/lib/' \
            -i.orig gcc/config/i386/t-linux64;
                    
        ;;
esac
popd;

mkdir gccbuild
pushd gccbuild

echo "Configure"
# TODO: Re-enable the libsanitizer, currently it throws an error when it tries to compile using musl as it can't find the fstab.h file
# Similar error can be found on the Gentoo bugtracker: https://bugs.gentoo.org/713072
${SRCDIR}/configure --prefix=${TOOLS} \
    --host=$(uname -m)-pc-linux-gnu \
    --build=$(uname -m)-pc-linux-gnu \
    --target=${LFS_TGT} \
    --with-sysroot=${TOOLS}/${LFS_TGT} \
    --disable-nls \
    --disable-multilib \
    --disable-libmudflap \
    --enable-languages=c,c++ \
    --enable-c99 \
    --enable-long-long \
    --with-mpc=${SRCDIR}/mpc \
    --with-mpfr=${SRCDIR}/mpfr \
    --with-gmp=${SRCDIR}/gmp \
    --with-float=${LFS_FLOAT} \
    --with-fpu=${LFS_FPU} \
    --disable-libsanitizer 
    # --with-arch=armv71 \
    # --with-mpfr-include=${SRCDIR}/mpfr/src \
    # --with-mpfr-lib=${SRCDIR}/mpfr/src/.libs \
make -j &&
make install
echo "Done";
popd;
read -n 1 -p "GCC2 done" i
