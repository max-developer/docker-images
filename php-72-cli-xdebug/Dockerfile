FROM maxdeveloper/php-72-cli

ENV XDEBUG_REMOTE_PORT=9000 \
    XDEBUG_IDE_KEY=PHPSTORM

RUN apk --no-cache --verbose add --progress php7-pecl-xdebug

COPY ./xdebug.ini /etc/php7/conf.d/xdebug.ini