#!/bin/bash

while true; do

nohup /usr/local/bin/php /var/www/gym/artisan redis:subscribe >> /var/logs/redis.log &

PID=$!
wait $PID
echo $PID has ended

sleep 1;
done;