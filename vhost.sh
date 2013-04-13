#!/bin/sh

# This script is based on https://github.com/MattSkala/apache-vhost script.

# A simple bash script that creates a virtual host in Apache on Windows Msysgit
# Usage: sh ./vhost.sh myweb.dev 'c:\Projects\myweb\www'

HOSTS=/c/Windows/System32/Drivers/etc/hosts
HTTPDCONF=/d/wamp/bin/apache/apache2.2.22/conf/extra/httpd-vhosts.conf

# 2 arguments are required
if [ -o $1 ]
	then
		echo "You have to provide a domain name"
		exit
fi

if [ -o $2 ]
	then
		echo "You have to provide a path"
		exit
fi

# Map domain to localhost in hosts file
echo -e "127.0.0.1		$1" >> $HOSTS

# Add virtual host to httpd.conf
echo "
# $1 Templates
<VirtualHost *:807>
	ServerAdmin admin@localhost.com
	DocumentRoot '$2'
	ServerName $1
	ServerAlias $1
	<Directory '$2'>
		AllowOverride All
		Order allow,deny
		Allow from all
	</Directory>
</VirtualHost>" >> $HTTPDCONF

echo "$1 mapped to $2"

# Restart Apache
net stop wampapache

net start wampapache