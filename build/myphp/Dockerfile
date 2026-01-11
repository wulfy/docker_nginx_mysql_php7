FROM php:8.1-fpm

RUN apt-get update
RUN apt-get install -y zlib1g-dev libjpeg-dev libpng-dev libfreetype6-dev
RUN apt-get install -y vim

RUN docker-php-ext-install pdo_mysql
RUN docker-php-ext-configure gd --with-freetype --with-jpeg
RUN docker-php-ext-install gd
RUN docker-php-ext-install mysqli
RUN docker-php-ext-install bcmath

## APCu
RUN pecl install apcu-5.1.21 \
RUN docker-php-ext-enable apcu