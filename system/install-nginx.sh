#! /bin/bash
#
# install-nginx.sh
# Copyright (C) 2016 Michael Zapf <michi.zapf@mztx.de>
#


# base system command line tools
apt-get -y --no-install-recommends install nginx-light php5-fpm


mkdir -p /var/www/diagnostics
mkdir -p /var/www/signage


# remove all previous installed site configurations
echo "Remove old configuration files..."
rm -f /etc/nginx/sites-enabled/*
rm -f /etc/nginx/conf.d/diagnostic-htpasswd

# copy our sites
echo "Copy new configuration files..."
cp ./skeleton/nginx/site-diagnostics /etc/nginx/sites-enabled/
cp ./skeleton/nginx/site-signage /etc/nginx/sites-enabled/
cp ./skeleton/nginx/diagnostic-htpasswd /etc/nginx/conf.d/
cp -r ./skeleton/www/* /var/www/


# restart server daemon
service nginx restart


