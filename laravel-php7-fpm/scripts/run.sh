echo "composer install"
cd /var/www/gym
composer install
echo "start php redis"
sh /opt/scripts/php-redis-deamon.sh &
echo "start php-fpm"
php-fpm
echo "end script"