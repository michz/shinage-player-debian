#! /bin/bash
#
# install-base.sh
# Copyright (C) 2016 Michael Zapf <michi.zapf@mztx.de>
#

apt-get update

# base system command line tools
apt-get -y --no-install-recommends install aptitude vim less tree sudo bash-completion screen psmisc

# x server / graphical system
#apt-get -y --no-install-recommends install chromium x11-xserver-utils unclutter xinit xserver-xorg-video-fbdev


cd /etc/X11/
Xorg -configure

