#!/bin/bash
echo "composer install"
/usr/local/bin/composer install -d /var/www/gym
echo "start php redis"
/bin/sh /opt/scripts/php-redis-deamon.sh &
echo "start php-fpm"
/usr/local/sbin/php-fpm