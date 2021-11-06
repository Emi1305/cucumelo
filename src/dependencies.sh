#!/bin/sh

mkdir ${LFS}/sources;
pushd ${LFS}/sources;
alias down="wget -q"

echo "Downloading dependencies";
#echo "Downloading Acl (2.3.1) - 348 KB:"
#down https://download.savannah.gnu.org/releases/acl/acl-2.3.1.tar.xz
#down https://download.savannah.gnu.org/releases/acl/acl-2.3.1.tar.xz.sig
#echo "Downloading Attr (2.5.1) - 456 KB:"
#down https://download.savannah.gnu.org/releases/attr/attr-2.5.1.tar.gz
#down https://download.savannah.gnu.org/releases/attr/attr-2.5.1.tar.gz.sig
#echo "Downloading Autoconf (2.71) - 1,263 KB:"
#down https://ftp.gnu.org/gnu/autoconf/autoconf-2.71.tar.xz
#down https://ftp.gnu.org/gnu/autoconf/autoconf-2.71.tar.xz.sig
#echo "Downloading Automake (1.16.4) - 1,564 KB:"
#down https://ftp.gnu.org/gnu/automake/automake-1.16.4.tar.xz
#down https://ftp.gnu.org/gnu/automake/automake-1.16.4.tar.xz.sig
#echo "Downloading Bash (5.1.8) - 10,287 KB:"
#down https://ftp.gnu.org/gnu/bash/bash-5.1.8.tar.gz
#down https://ftp.gnu.org/gnu/bash/bash-5.1.8.tar.gz.sig
#echo "Downloading Bc (5.0.0) - 420 KB:"
#down https://github.com/gavinhoward/bc/releases/download/5.0.0/bc-5.0.0.tar.xz
#down https://github.com/gavinhoward/bc/releases/download/5.0.0/bc-5.0.0.tar.xz.sig
echo "Downloading Binutils (2.37) - 22,390 KB:"
down https://ftp.gnu.org/gnu/binutils/binutils-2.37.tar.xz
down https://ftp.gnu.org/gnu/binutils/binutils-2.37.tar.xz.sig
#echo "Downloading Bison (3.7.6) - 2,566 KB:"
#down https://ftp.gnu.org/gnu/bison/bison-3.7.6.tar.xz
#down https://ftp.gnu.org/gnu/bison/bison-3.7.6.tar.xz.sig
#echo "Downloading Bzip2 (1.0.8) - 792 KB:"
#down https://www.sourceware.org/pub/bzip2/bzip2-1.0.8.tar.gz
#down https://www.sourceware.org/pub/bzip2/bzip2-1.0.8.tar.gz.sig
#echo "Downloading Check (0.15.2) - 760 KB:"
#down https://github.com/libcheck/check/releases/download/0.15.2/check-0.15.2.tar.gz
#down https://github.com/libcheck/check/releases/download/0.15.2/check-0.15.2.tar.gz.sig
#echo "Downloading Coreutils (8.32) - 5,418 KB:"
#down https://ftp.gnu.org/gnu/coreutils/coreutils-8.32.tar.xz
#down https://ftp.gnu.org/gnu/coreutils/coreutils-8.32.tar.xz.sig
#echo "Downloading DejaGNU (1.6.3) - 608 KB:"
#down https://ftp.gnu.org/gnu/dejagnu/dejagnu-1.6.3.tar.gz
#down https://ftp.gnu.org/gnu/dejagnu/dejagnu-1.6.3.tar.gz.sig
#echo "Downloading Diffutils (3.8) - 1,548 KB:"
#down https://ftp.gnu.org/gnu/diffutils/diffutils-3.8.tar.xz
#down https://ftp.gnu.org/gnu/diffutils/diffutils-3.8.tar.xz.sig
#echo "Downloading E2fsprogs (1.46.4) - 9,298 KB:"
#down https://downloads.sourceforge.net/project/e2fsprogs/e2fsprogs/v1.46.4/e2fsprogs-1.46.4.tar.gz
#down https://downloads.sourceforge.net/project/e2fsprogs/e2fsprogs/v1.46.4/e2fsprogs-1.46.4.tar.gz.sig
#echo "Downloading Elfutils (0.185) - 8,973 KB:"
#down https://sourceware.org/ftp/elfutils/0.185/elfutils-0.185.tar.bz2
#down https://sourceware.org/ftp/elfutils/0.185/elfutils-0.185.tar.bz2.sig
#echo "Downloading Eudev (3.2.10) - 1,916 KB:"
#down https://dev.gentoo.org/~blueness/eudev/eudev-3.2.10.tar.gz
#down https://dev.gentoo.org/~blueness/eudev/eudev-3.2.10.tar.gz.sig
#echo "Downloading Expat (2.4.1) - 435 KB:"
#down https://prdownloads.sourceforge.net/expat/expat-2.4.1.tar.xz
#down https://prdownloads.sourceforge.net/expat/expat-2.4.1.tar.xz.sig
#echo "Downloading Expect (5.45.4) - 618 KB:"
#down https://prdownloads.sourceforge.net/expect/expect5.45.4.tar.gz
#down https://prdownloads.sourceforge.net/expect/expect5.45.4.tar.gz.sig
#echo "Downloading File (5.40) - 981 KB:"
#down https://astron.com/pub/file/file-5.40.tar.gz
#down https://astron.com/pub/file/file-5.40.tar.gz.sig
#echo "Downloading Findutils (4.8.0) - 1,940 KB:"
#down https://ftp.gnu.org/gnu/findutils/findutils-4.8.0.tar.xz
#down https://ftp.gnu.org/gnu/findutils/findutils-4.8.0.tar.xz.sig
#echo "Downloading Flex (2.6.4) - 1,386 KB:"
#down https://github.com/westes/flex/releases/download/v2.6.4/flex-2.6.4.tar.gz
#down https://github.com/westes/flex/releases/download/v2.6.4/flex-2.6.4.tar.gz.sig
#echo "Downloading Gawk (5.1.0) - 3,081 KB:"
#down https://ftp.gnu.org/gnu/gawk/gawk-5.1.0.tar.xz
#down https://ftp.gnu.org/gnu/gawk/gawk-5.1.0.tar.xz.sig
echo "Downloading GCC (11.2.0) - 78,996 KB:"
down https://ftp.gnu.org/gnu/gcc/gcc-11.2.0/gcc-11.2.0.tar.xz
down https://ftp.gnu.org/gnu/gcc/gcc-11.2.0/gcc-11.2.0.tar.xz.sig
#echo "Downloading GDBM (1.20) - 965 KB:"
#down https://ftp.gnu.org/gnu/gdbm/gdbm-1.20.tar.gz
#down https://ftp.gnu.org/gnu/gdbm/gdbm-1.20.tar.gz.sig
#echo "Downloading Gettext (0.21) - 9,487 KB:"
#down https://ftp.gnu.org/gnu/gettext/gettext-0.21.tar.xz
#down https://ftp.gnu.org/gnu/gettext/gettext-0.21.tar.xz.sig
#echo "Downloading Glibc (2.34) - 16,896 KB:"
#down https://ftp.gnu.org/gnu/glibc/glibc-2.34.tar.xz
#down https://ftp.gnu.org/gnu/glibc/glibc-2.34.tar.xz.sig
echo "Downloading GMP (6.2.1) - 1,980 KB:"
down https://ftp.gnu.org/gnu/gmp/gmp-6.2.1.tar.xz
down https://ftp.gnu.org/gnu/gmp/gmp-6.2.1.tar.xz.sig
#echo "Downloading Gperf (3.1) - 1,188 KB:"
#down https://ftp.gnu.org/gnu/gperf/gperf-3.1.tar.gz
#down https://ftp.gnu.org/gnu/gperf/gperf-3.1.tar.gz.sig
#echo "Downloading Grep (3.7) - 1,603 KB:"
#down https://ftp.gnu.org/gnu/grep/grep-3.7.tar.xz
#down https://ftp.gnu.org/gnu/grep/grep-3.7.tar.xz.sig
#echo "Downloading Groff (1.22.4) - 4,044 KB:"
#down https://ftp.gnu.org/gnu/groff/groff-1.22.4.tar.gz
#down https://ftp.gnu.org/gnu/groff/groff-1.22.4.tar.gz.sig
#echo "Downloading GRUB (2.06) - 6,428 KB:"
#down https://ftp.gnu.org/gnu/grub/grub-2.06.tar.xz
#down https://ftp.gnu.org/gnu/grub/grub-2.06.tar.xz.sig
#echo "Downloading Gzip (1.10) - 757 KB:"
#down https://ftp.gnu.org/gnu/gzip/gzip-1.10.tar.xz
#down https://ftp.gnu.org/gnu/gzip/gzip-1.10.tar.xz.sig
#echo "Downloading Iana-Etc (20210611) - 579 KB:"
#down https://github.com/Mic92/iana-etc/releases/download/20210611/iana-etc-20210611.tar.gz
#down https://github.com/Mic92/iana-etc/releases/download/20210611/iana-etc-20210611.tar.gz.sig
#echo "Downloading Inetutils (2.1) - 1,496 KB:"
#down https://ftp.gnu.org/gnu/inetutils/inetutils-2.1.tar.xz
#down https://ftp.gnu.org/gnu/inetutils/inetutils-2.1.tar.xz.sig
#echo "Downloading Intltool (0.51.0) - 159 KB:"
#down https://launchpad.net/intltool/trunk/0.51.0/+download/intltool-0.51.0.tar.gz
#down https://launchpad.net/intltool/trunk/0.51.0/+download/intltool-0.51.0.tar.gz.sig
#echo "Downloading IPRoute2 (5.13.0) - 828 KB:"
#down https://www.kernel.org/pub/linux/utils/net/iproute2/iproute2-5.13.0.tar.xz
#down https://www.kernel.org/pub/linux/utils/net/iproute2/iproute2-5.13.0.tar.xz.sig
#echo "Downloading Kbd (2.4.0) - 1,095 KB:"
#down https://www.kernel.org/pub/linux/utils/kbd/kbd-2.4.0.tar.xz
#down https://www.kernel.org/pub/linux/utils/kbd/kbd-2.4.0.tar.xz.sig
#echo "Downloading Kmod (29) - 548 KB:"
#down https://www.kernel.org/pub/linux/utils/kernel/kmod/kmod-29.tar.xz
#down https://www.kernel.org/pub/linux/utils/kernel/kmod/kmod-29.tar.xz.sig
#echo "Downloading Less (590) - 348 KB:"
#down https://www.greenwoodsoftware.com/less/less-590.tar.gz
#down https://www.greenwoodsoftware.com/less/less-590.tar.gz.sig
#echo "Downloading LFS-Bootscripts (20210608) - 33 KB:"
#down https://www.linuxfromscratch.org/lfs/downloads/11.0/lfs-bootscripts-20210608.tar.xz
#down https://www.linuxfromscratch.org/lfs/downloads/11.0/lfs-bootscripts-20210608.tar.xz.sig
#echo "Downloading Libcap (2.53) - 153 KB:"
#down https://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2/libcap-2.53.tar.xz
#down https://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2/libcap-2.53.tar.xz.sig
#echo "Downloading Libffi (3.4.2) - 1,320 KB:"
#down https://github.com/libffi/libffi/releases/download/v3.4.2/libffi-3.4.2.tar.gz
#down https://github.com/libffi/libffi/releases/download/v3.4.2/libffi-3.4.2.tar.gz.sig
#echo "Downloading Libpipeline (1.5.3) - 972 KB:"
#down https://download.savannah.gnu.org/releases/libpipeline/libpipeline-1.5.3.tar.gz
#down https://download.savannah.gnu.org/releases/libpipeline/libpipeline-1.5.3.tar.gz.sig
#echo "Downloading Libtool (2.4.6) - 951 KB:"
#down https://ftp.gnu.org/gnu/libtool/libtool-2.4.6.tar.xz
#down https://ftp.gnu.org/gnu/libtool/libtool-2.4.6.tar.xz.sig
echo "Downloading Linux (5.13.12) - 116,545 KB:"
down https://www.kernel.org/pub/linux/kernel/v5.x/linux-5.13.12.tar.xz
down https://www.kernel.org/pub/linux/kernel/v5.x/linux-5.13.12.tar.xz.sig
#echo "Downloading M4 (1.4.19) - 1,617 KB:"
#down https://ftp.gnu.org/gnu/m4/m4-1.4.19.tar.xz
#down https://ftp.gnu.org/gnu/m4/m4-1.4.19.tar.xz.sig
#echo "Downloading Make (4.3) - 2,263 KB:"
#down https://ftp.gnu.org/gnu/make/make-4.3.tar.gz
#down https://ftp.gnu.org/gnu/make/make-4.3.tar.gz.sig
#echo "Downloading Man-DB (2.9.4) - 1,865 KB:"
#down https://download.savannah.gnu.org/releases/man-db/man-db-2.9.4.tar.xz
#down https://download.savannah.gnu.org/releases/man-db/man-db-2.9.4.tar.xz.sig
#echo "Downloading Man-pages (5.13) - 1,752 KB:"
#down https://www.kernel.org/pub/linux/docs/man-pages/man-pages-5.13.tar.xz
#down https://www.kernel.org/pub/linux/docs/man-pages/man-pages-5.13.tar.xz.sig
#echo "Downloading Meson (0.59.1) - 1,900 KB:"
#down https://github.com/mesonbuild/meson/releases/download/0.59.1/meson-0.59.1.tar.gz
#down https://github.com/mesonbuild/meson/releases/download/0.59.1/meson-0.59.1.tar.gz.sig
echo "Downloading MPC (1.2.1) - 820 KB:"
down https://ftp.gnu.org/gnu/mpc/mpc-1.2.1.tar.gz
down https://ftp.gnu.org/gnu/mpc/mpc-1.2.1.tar.gz.sig
echo "Downloading MPFR (4.1.0) - 1,490 KB:"
down https://www.mpfr.org/mpfr-4.1.0/mpfr-4.1.0.tar.xz
down https://www.mpfr.org/mpfr-4.1.0/mpfr-4.1.0.tar.xz.sig
#echo "Downloading Ncurses (6.2) - 3,346 KB:"
#down https://ftp.gnu.org/gnu/ncurses/ncurses-6.2.tar.gz
#down https://ftp.gnu.org/gnu/ncurses/ncurses-6.2.tar.gz.sig
#echo "Downloading Ninja (1.10.2) - 209 KB:"
#down https://github.com/ninja-build/ninja/archive/v1.10.2/ninja-1.10.2.tar.gz
#down https://github.com/ninja-build/ninja/archive/v1.10.2/ninja-1.10.2.tar.gz.sig
#echo "Downloading OpenSSL (1.1.1l) - 9,604 KB:"
#down https://www.openssl.org/source/openssl-1.1.1l.tar.gz
#down https://www.openssl.org/source/openssl-1.1.1l.tar.gz.sig
#echo "Downloading Patch (2.7.6) - 766 KB:"
#down https://ftp.gnu.org/gnu/patch/patch-2.7.6.tar.xz
#down https://ftp.gnu.org/gnu/patch/patch-2.7.6.tar.xz.sig
#echo "Downloading Perl (5.34.0) - 12,580 KB:"
#down https://www.cpan.org/src/5.0/perl-5.34.0.tar.xz
#down https://www.cpan.org/src/5.0/perl-5.34.0.tar.xz.sig
#echo "Downloading Pkg-config (0.29.2) - 1,970 KB:"
#down https://pkg-config.freedesktop.org/releases/pkg-config-0.29.2.tar.gz
#down https://pkg-config.freedesktop.org/releases/pkg-config-0.29.2.tar.gz.sig
#echo "Downloading Procps (3.3.17) - 985 KB:"
#down https://sourceforge.net/projects/procps-ng/files/Production/procps-ng-3.3.17.tar.xz
#down https://sourceforge.net/projects/procps-ng/files/Production/procps-ng-3.3.17.tar.xz.sig
#echo "Downloading Psmisc (23.4) - 362 KB:"
#down https://sourceforge.net/projects/psmisc/files/psmisc/psmisc-23.4.tar.xz
#down https://sourceforge.net/projects/psmisc/files/psmisc/psmisc-23.4.tar.xz.sig
#echo "Downloading Python (3.9.6) - 18,608 KB:"
#down https://www.python.org/ftp/python/3.9.6/Python-3.9.6.tar.xz
#down https://www.python.org/ftp/python/3.9.6/Python-3.9.6.tar.xz.sig
#echo "Downloading Python Documentation (3.9.6) - 6,692 KB:"
#down https://www.python.org/ftp/python/doc/3.9.6/python-3.9.6-docs-html.tar.bz2
#down https://www.python.org/ftp/python/doc/3.9.6/python-3.9.6-docs-html.tar.bz2.sig
#echo "Downloading Readline (8.1) - 2,924 KB:"
#down https://ftp.gnu.org/gnu/readline/readline-8.1.tar.gz
#down https://ftp.gnu.org/gnu/readline/readline-8.1.tar.gz.sig
#echo "Downloading Sed (4.8) - 1,317 KB:"
#down https://ftp.gnu.org/gnu/sed/sed-4.8.tar.xz
#down https://ftp.gnu.org/gnu/sed/sed-4.8.tar.xz.sig
#echo "Downloading Shadow (4.9) - 1,592 KB:"
#down https://github.com/shadow-maint/shadow/releases/download/v4.9/shadow-4.9.tar.xz
#down https://github.com/shadow-maint/shadow/releases/download/v4.9/shadow-4.9.tar.xz.sig
#echo "Downloading Sysklogd (1.5.1) - 88 KB:"
#down https://www.infodrom.org/projects/sysklogd/download/sysklogd-1.5.1.tar.gz
#down https://www.infodrom.org/projects/sysklogd/download/sysklogd-1.5.1.tar.gz.sig
#echo "Downloading Sysvinit (2.99) - 124 KB:"
#down https://download.savannah.gnu.org/releases/sysvinit/sysvinit-2.99.tar.xz
#down https://download.savannah.gnu.org/releases/sysvinit/sysvinit-2.99.tar.xz.sig
#echo "Downloading Tar (1.34) - 2,174 KB:"
#down https://ftp.gnu.org/gnu/tar/tar-1.34.tar.xz
#down https://ftp.gnu.org/gnu/tar/tar-1.34.tar.xz.sig
#echo "Downloading Tcl (8.6.11) - 10,020 KB:"
#down https://downloads.sourceforge.net/tcl/tcl8.6.11-src.tar.gz
#down https://downloads.sourceforge.net/tcl/tcl8.6.11-src.tar.gz.sig
#echo "Downloading Tcl Documentation (8.6.11) - 1,172 KB:"
#down https://downloads.sourceforge.net/tcl/tcl8.6.11-html.tar.gz
#down https://downloads.sourceforge.net/tcl/tcl8.6.11-html.tar.gz.sig
#echo "Downloading Texinfo (6.8) - 4,848 KB:"
#down https://ftp.gnu.org/gnu/texinfo/texinfo-6.8.tar.xz
#down https://ftp.gnu.org/gnu/texinfo/texinfo-6.8.tar.xz.sig
#echo "Downloading Time Zone Data (2021a) - 403 KB:"
#down https://www.iana.org/time-zones/repository/releases/tzdata2021a.tar.gz
#down https://www.iana.org/time-zones/repository/releases/tzdata2021a.tar.gz.sig
#echo "Downloading Udev-lfs Tarball (udev-lfs-20171102) - 11 KB:"
#down https://anduin.linuxfromscratch.org/LFS/udev-lfs-20171102.tar.xz
#down https://anduin.linuxfromscratch.org/LFS/udev-lfs-20171102.tar.xz.sig
#echo "Downloading Util-linux (2.37.2) - 5,490 KB:"
#down https://www.kernel.org/pub/linux/utils/util-linux/v2.37/util-linux-2.37.2.tar.xz
#down https://www.kernel.org/pub/linux/utils/util-linux/v2.37/util-linux-2.37.2.tar.xz.sig
#echo "Downloading Vim (8.2.3337) - 15,311 KB:"
#down https://anduin.linuxfromscratch.org/LFS/vim-8.2.3337.tar.gz
#down https://anduin.linuxfromscratch.org/LFS/vim-8.2.3337.tar.gz.sig
#echo "Downloading XML::Parser (2.46) - 249 KB:"
#down https://cpan.metacpan.org/authors/id/T/TO/TODDR/XML-Parser-2.46.tar.gz
#down https://cpan.metacpan.org/authors/id/T/TO/TODDR/XML-Parser-2.46.tar.gz.sig
#echo "Downloading Xz Utils (5.2.5) - 1,122 KB:"
#down https://tukaani.org/xz/xz-5.2.5.tar.xz
#down https://tukaani.org/xz/xz-5.2.5.tar.xz.sig
#echo "Downloading Zlib (1.2.11) - 457 KB:"
#down https://zlib.net/zlib-1.2.11.tar.xz
#down https://zlib.net/zlib-1.2.11.tar.xz.sig
#echo "Downloading Zstd (1.5.0) - 1,808 KB:"
#down https://github.com/facebook/zstd/releases/download/v1.5.0/zstd-1.5.0.tar.gz
#down https://github.com/facebook/zstd/releases/download/v1.5.0/zstd-1.5.0.tar.gz.sig
echo "Downloading Musl (Latest)"
down http://www.musl-libc.org/releases/musl-latest.tar.gz
echo "Downloading busybox"
down https://busybox.net/downloads/busybox-1.34.1.tar.bz2
down https://busybox.net/downloads/busybox-1.34.1.tar.bz2.sig
echo "Downloading iana-etc"
down http://sethwklein.net/iana-etc-2.30.tar.bz2
popd;
