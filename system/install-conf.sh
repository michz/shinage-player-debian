#! /bin/sh
#
# install-conf.sh
# Copyright (C) 2017 Michael Zapf <michi.zapf@mztx.de>
#
# Distributed under terms of the MIT license.
#


apt-get -y --no-install-recommends install uuid-runtime

mkdir /etc/shinage-player
cp -r $SCRIPTPATH/skeleton/shinage-player-conf/* /etc/shinage-player/
chmod 755 /etc/shinage-player/
chmod -R 644 /etc/shinage-player/*

# generate display ID
uuidgen > /etc/shinage-player/uuid.conf

