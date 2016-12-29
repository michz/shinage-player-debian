#! /bin/bash
#
# install-base.sh
# Copyright (C) 2016 Michael Zapf <michi.zapf@mztx.de>
#

SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")
UHOME=/home/sign

# get apt repo up-to-date
apt-get update

# base system command line tools
apt-get -y --no-install-recommends install sudo dropbear

# webserver
./install-nginx.sh


# create user
adduser --disabled-password --gecos 'sign' --home $UHOME --shell /bin/bash sign

## set password (DEACTIVATED)
#echo "sign:signage" | chpasswd


# create symlinks and adjust rights
cp $SCRIPTPATH/skeleton/.bash_aliases $UHOME/
#chmod ugo+rx $SCRIPTPATH/skeleton/.bash_aliases

cp $SCRIPTPATH/skeleton/.profile $UHOME/
#chmod ugo+rx $SCRIPTPATH/skeleton/.profile

#cp $SCRIPTPATH/skeleton/.bash_aliases $UHOME/
#chmod ugo+rx $SCRIPTPATH/skeleton/.bash_aliases

cp $SCRIPTPATH/skeleton/.screenrc $UHOME/
#chmod ugo+rx $SCRIPTPATH/skeleton/.screenrc

cp $SCRIPTPATH/skeleton/.xsession $UHOME/
#chmod ugo+rx $SCRIPTPATH/skeleton/.xsession

mkdir -p /usr/local/bin/
cp $SCRIPTPATH/skeleton/run-browser.sh /usr/local/bin/run-browser.sh
chmod ugo+rx /usr/local/bin/run-browser.sh


# x server / graphical system
apt-get -y --no-install-recommends install chromium x11-xserver-utils \
    unclutter xinit xserver-xorg-video-fbdev xserver-xorg-input-evdev

# create symlink for X server start
ln -s /usr/bin/Xorg /usr/bin/X

# enable user input in X
adduser sign input

# enable user to use framebuffer device
adduser sign video


# create mount folder for usb sticks and install udev scripts
mkdir -p /mnt/usb
cp $SCRIPTPATH/skeleton/write_lastmount.sh /mnt/
cp $SCRIPTPATH/skeleton/11-usb-automount.rules /etc/udev/rules.d/


# startup config
cp $SCRIPTPATH/skeleton/rc.local /etc/rc.local
cp $SCRIPTPATH/skeleton/getty@tty1.service /etc/systemd/system/getty.target.wants/
cp $SCRIPTPATH/skeleton/default_grub /etc/default/grub
/usr/sbin/update-grub

echo "tmpfs    /var/log    tmpfs    defaults,size=10%      0       0" >> /etc/fstab
echo "tmpfs    /tmp        tmpfs    defaults,size=20%      0       0" >> /etc/fstab

echo "www-data  ALL = NOPASSWD: /sbin/reboot,/sbin/poweroff" >> /etc/sudoers




