#!/bin/sh

cat > ${LFS}/targetfs/etc/mdev.conf<< "EOF"
# /etc/mdev/conf

# Devices:
# Syntax: %s %d:%d %s
# devices user:group mode

# null does already exist; therefore ownership has to be changed with command
null    root:root 0666  @chmod 666 $MDEV
zero    root:root 0666
grsec   root:root 0660
full    root:root 0666

random  root:root 0666
urandom root:root 0444
hwrandom root:root 0660

# console does already exist; therefore ownership has to be changed with command
#console        root:tty 0600   @chmod 600 $MDEV && mkdir -p vc && ln -sf ../$MDEV vc/0
console root:tty 0600 @mkdir -pm 755 fd && cd fd && for x in 0 1 2 3 ; do ln -sf /proc/self/fd/$x $x; done

fd0     root:floppy 0660
kmem    root:root 0640
mem     root:root 0640
port    root:root 0640
ptmx    root:tty 0666

# ram.*
ram([0-9]*)     root:disk 0660 >rd/%1
loop([0-9]+)    root:disk 0660 >loop/%1
sd[a-z].*       root:disk 0660 */lib/mdev/usbdisk_link
hd[a-z][0-9]*   root:disk 0660 */lib/mdev/ide_links
md[0-9]         root:disk 0660

tty             root:tty 0666
tty[0-9]        root:root 0600
tty[0-9][0-9]   root:tty 0660
ttyS[0-9]*      root:tty 0660
pty.*           root:tty 0660
vcs[0-9]*       root:tty 0660
vcsa[0-9]*      root:tty 0660

ttyLTM[0-9]     root:dialout 0660 @ln -sf $MDEV modem
ttySHSF[0-9]    root:dialout 0660 @ln -sf $MDEV modem
slamr           root:dialout 0660 @ln -sf $MDEV slamr0
slusb           root:dialout 0660 @ln -sf $MDEV slusb0
fuse            root:root  0666

# dri device
card[0-9]       root:video 0660 =dri/

# alsa sound devices and audio stuff
pcm.*           root:audio 0660 =snd/
control.*       root:audio 0660 =snd/
midi.*          root:audio 0660 =snd/
seq             root:audio 0660 =snd/
timer           root:audio 0660 =snd/

adsp            root:audio 0660 >sound/
audio           root:audio 0660 >sound/
dsp             root:audio 0660 >sound/
mixer           root:audio 0660 >sound/
sequencer.*     root:audio 0660 >sound/

# misc stuff
agpgart         root:root 0660  >misc/
psaux           root:root 0660  >misc/
rtc             root:root 0664  >misc/

# input stuff
event[0-9]+     root:root 0640 =input/
mice            root:root 0640 =input/
mouse[0-9]      root:root 0640 =input/
ts[0-9]         root:root 0600 =input/

# v4l stuff
vbi[0-9]        root:video 0660 >v4l/
video[0-9]      root:video 0660 >v4l/

# dvb stuff
dvb.*           root:video 0660 */lib/mdev/dvbdev

# load drivers for usb devices
usbdev[0-9].[0-9]       root:root 0660 */lib/mdev/usbdev
usbdev[0-9].[0-9]_.*    root:root 0660

# net devices
tun[0-9]*       root:root 0600 =net/
tap[0-9]*       root:root 0600 =net/

# zaptel devices
zap(.*)         root:dialout 0660 =zap/%1
dahdi!(.*)      root:dialout 0660 =dahdi/%1

# raid controllers
cciss!(.*)      root:disk 0660 =cciss/%1
ida!(.*)        root:disk 0660 =ida/%1
rd!(.*)         root:disk 0660 =rd/%1

sr[0-9]         root:cdrom 0660 @ln -sf $MDEV cdrom 

# hpilo
hpilo!(.*)      root:root 0660 =hpilo/%1

# xen stuff
xvd[a-z]        root:root 0660 */lib/mdev/xvd_links
EOF

cat > ${LFS}/targetfs/etc/profile << "EOF"
# /etc/profile

# Set the initial path
export PATH=/bin:/usr/bin

if [ `id -u` -eq 0 ] ; then
        PATH=/bin:/sbin:/usr/bin:/usr/sbin
        unset HISTFILE
fi

# Setup some environment variables.
export USER=`id -un`
export LOGNAME=$USER
export HOSTNAME=`/bin/hostname`
export HISTSIZE=1000
export HISTFILESIZE=1000
export PAGER='/bin/more '
export EDITOR='/bin/vi'

# End /etc/profile
EOF

cat > ${LFS}/targetfs/etc/inittab<< "EOF"
# /etc/inittab

::sysinit:/etc/rc.d/startup

tty1::respawn:/sbin/getty 38400 tty1
tty2::respawn:/sbin/getty 38400 tty2
tty3::respawn:/sbin/getty 38400 tty3
tty4::respawn:/sbin/getty 38400 tty4
tty5::respawn:/sbin/getty 38400 tty5
tty6::respawn:/sbin/getty 38400 tty6

# Put a getty on the serial line (for a terminal).  Uncomment this line if
# you're using a serial console on ttyS0, or uncomment and adjust it if using a
# serial console on a different serial port.
#::respawn:/sbin/getty -L ttyS0 115200 vt100

::shutdown:/etc/rc.d/shutdown
::ctrlaltdel:/sbin/reboot
EOF

echo "[Cucumelo]" > ${LFS}/targetfs/etc/hostname

cat > ${LFS}/targetfs/etc/hosts << "EOF"
127.0.0.1 localhost
EOF

mkdir -pv ${LFS}/targetfs/etc/network/if-{post-{up,down},pre-{up,down},up,down}.d
mkdir -pv ${LFS}/targetfs/usr/share/udhcpc

cat > ${LFS}/targetfs/etc/network/interfaces << "EOF"
auto eth0
iface eth0 inet dhcp
EOF

cat > ${LFS}/targetfs/usr/share/udhcpc/default.script << "EOF"
#!/bin/sh
# udhcpc Interface Configuration
# Based on http://lists.debian.org/debian-boot/2002/11/msg00500.html
# udhcpc script edited by Tim Riker <Tim@Rikers.org>

[ -z "$1" ] && echo "Error: should be called from udhcpc" && exit 1

RESOLV_CONF="/etc/resolv.conf"
[ -n "$broadcast" ] && BROADCAST="broadcast $broadcast"
[ -n "$subnet" ] && NETMASK="netmask $subnet"

case "$1" in
        deconfig)
                /sbin/ifconfig $interface 0.0.0.0
                ;;

        renew|bound)
                /sbin/ifconfig $interface $ip $BROADCAST $NETMASK

                if [ -n "$router" ] ; then
                        while route del default gw 0.0.0.0 dev $interface ; do
                                true
                        done

                        for i in $router ; do
                                route add default gw $i dev $interface
                        done
                fi

                echo -n > $RESOLV_CONF
                [ -n "$domain" ] && echo search $domain >> $RESOLV_CONF
                for i in $dns ; do
                        echo nameserver $i >> $RESOLV_CONF
                done
                ;;
esac

exit 0
EOF

chmod +x ${LFS}/targetfs/usr/share/udhcpc/default.script
