FROM php:7-fpm
MAINTAINER Mike Chernev <mike@mikechernev.com>

RUN sed -i "s/archive.ubuntu./mirrors.aliyun./g" /etc/apt/sources.list 
RUN sed -i "s/deb.debian.org/mirrors.aliyun.com/g" /etc/apt/sources.list 
RUN sed -i "s/security.debian.org/mirrors.aliyun.com\/debian-security/g" /etc/apt/sources.list

RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng12-dev \
        git \
    && docker-php-ext-install -j$(nproc) iconv mcrypt mbstring pdo_mysql \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd
    
# Install Composer
ENV COMPOSER_ALLOW_SUPERUSER 1
ADD ./composer-installer /tmp
RUN php /tmp/composer-installer --filename=composer --install-dir=/usr/local/bin
# 全局设置composer的中国镜像
RUN composer config -g repo.packagist composer https://packagist.phpcomposer.com

WORKDIR /var/www