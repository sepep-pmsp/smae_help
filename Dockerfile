FROM php:8.2-apache AS setup

RUN apt-get update

RUN apt-get -y install git

WORKDIR /src

COPY . /src/osTicket

RUN git clone --depth 1 --branch 1.17.x https://github.com/osTicket/osTicket-plugins

WORKDIR /src/osTicket

RUN php manage.php deploy --setup /var/www/html

FROM php:8.2-apache AS php

RUN apt-get update

RUN apt-get -y install zlib1g-dev libpng-dev libicu-dev libc-client-dev libkrb5-dev

RUN docker-php-ext-install mysqli

RUN docker-php-ext-install gd

RUN docker-php-ext-install intl

RUN docker-php-ext-install opcache

RUN docker-php-ext-configure imap --with-kerberos --with-imap-ssl

RUN docker-php-ext-install imap

# Configura o proxy no pear apenas se a variável não estiver vazia
RUN [ ! -z "${HTTP_PROXY}" ] && pear config-set http_proxy ${HTTP_PROXY} || echo "HTTP_PROXY is empty"

RUN pecl install apcu

RUN docker-php-ext-enable apcu

COPY --from=setup /var/www/html /var/www/html

RUN mv /var/www/html/include/ost-sampleconfig.php /var/www/html/include/ost-config.php

COPY pt_BR.phar /var/www/html/include/i18n/pt_BR.phar

RUN chown -R www-data:www-data /var/www/html

EXPOSE 80

RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

RUN echo "display_errors = off" >> /usr/local/etc/php/php.ini

RUN echo "log_errors = on" >> /usr/local/etc/php/php.ini

RUN echo "erro_log = /dev/stderr" >> /usr/local/etc/php/php.ini
