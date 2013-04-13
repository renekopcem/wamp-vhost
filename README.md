WAMP - Apache VirtualHost Console (msysgit)
==========================================
A simple bash script that creates a virtual host in Apache on Windows with WAMP.

How to use
----------
``sudo sh ./vhost.sh domain path``

(e.g. ``sh vhost.sh project.dev 'D:\project'``)

What it does
------------
- Adds a domain mapping to C:/windows/drives/etc/hosts
- Adds VirtualHost to C:\wamp_directory\bin\apache\apache2.2.22\conf\extra\httpd-vhosts.conf
- Restarts WampApache service

Thanks
------
This script is based on https://github.com/MattSkala/apache-vhost script.