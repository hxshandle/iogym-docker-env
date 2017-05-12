FROM php:7-fpm
MAINTAINER Handle Huang <handle.huang@outlook.com>

RUN sed -i "s/archive.ubuntu./mirrors.aliyun./g" /etc/apt/sources.list 
RUN sed -i "s/deb.debian.org/mirrors.aliyun.com/g" /etc/apt/sources.list 
RUN sed -i "s/security.debian.org/mirrors.aliyun.com\/debian-security/g" /etc/apt/sources.list

RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng12-dev \
        git \
        zip \
        unzip \
    && docker-php-ext-install -j$(nproc) iconv mcrypt mbstring pdo_mysql \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd


# for xdebug
# RUN pecl install \
#     && pecl install xdebug \
#     && docker-php-ext-enable xdebug \
#     && echo "zend_extension=$(find /usr/local/lib/php/extensions/ -name xdebug.so)" > /usr/local/etc/php/conf.d/xdebug.ini \
#     && echo "xdebug.remote_enable=on" >> /usr/local/etc/php/conf.d/xdebug.ini \
#     && echo "xdebug.remote_handler=\"dbgp\"" >> /usr/local/etc/php/conf.d/xdebug.ini \
#     && echo "xdebug.remote_host=\"$(/sbin/ip route|awk '/default/ { print $3 }')\"" >> /usr/local/etc/php/conf.d/xdebug.ini \
#     && echo "xdebug.remote_port=9000" >> /usr/local/etc/php/conf.d/xdebug.ini \
#     && echo "xdebug.idekey=\"PHPStorm\"" >> /usr/local/etc/php/conf.d/xdebug.ini \
#     && echo "xdebug.max_nesting_level=200" >> /usr/local/etc/php/conf.d/xdebug.ini \

# Install Composer
ENV COMPOSER_ALLOW_SUPERUSER 1
ADD ./composer-installer /tmp
RUN php /tmp/composer-installer --filename=composer --install-dir=/usr/local/bin
# 全局设置composer的中国镜像
RUN composer config -g repo.packagist composer https://packagist.phpcomposer.com

COPY ./scripts/run.sh /opt/scripts/run.sh
COPY ./scripts/php-redis-deamon.sh /opt/scripts/php-redis-deamon.sh

RUN chmod +x /opt/scripts/run.sh
RUN chmod +x /opt/scripts/php-redis-deamon.sh

WORKDIR /var/www

CMD ["/opt/scripts/run.sh"]


