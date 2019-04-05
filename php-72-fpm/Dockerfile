
ARG XDEBUG

FROM maxdeveloper/php-72-cli${XDEBUG}

COPY php-fpm.pool.conf /etc/php7/php-fpm.d/www.conf

RUN apk --no-cache add \
        php7-opcache \
        php7-fpm \
    && adduser -D -H -u 1000 -s /bin/bash www-data

WORKDIR /var/www

CMD ["php-fpm7", "-F"]

EXPOSE 9000