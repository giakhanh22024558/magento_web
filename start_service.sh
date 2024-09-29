#!/bin/sh

# Add entry to /etc/hosts
echo '127.0.0.1 webtest.net' >> /etc/hosts

# Start Elasticsearch
service elasticsearch start

# Start PHP-FPM
php8.3-fpm -F &

# Start Nginx
nginx -g 'daemon off;'