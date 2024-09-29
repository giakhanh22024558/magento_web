#!/bin/sh

# Add entry to /etc/hosts
echo '127.0.0.1 webtest.net' >> /etc/hosts

# Start Elasticsearch
service elasticsearch start

# Start PHP-FPM
service php8.3-fpm start 

# Start Nginx
nginx -g 'daemon off;'