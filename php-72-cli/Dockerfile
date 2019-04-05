FROM alpine:latest

RUN apk --no-cache --verbose add --progress \
        php7 \
        php7-ctype \
        php7-curl \
        php7-dom \
        php7-fileinfo \
        php7-ftp \
        php7-zip \
        php7-iconv \
        php7-json \
        php7-intl \
        php7-mbstring \
        php7-openssl \
        php7-pdo \
        php7-pdo_odbc \
        php7-pdo_mysql \
        php7-pdo_pgsql \
        php7-pear \
        php7-phar \
        php7-posix \
        php7-pcntl \
        php7-session \
        php7-simplexml \
        php7-tokenizer \
        php7-xml \
        php7-xmlreader \
        php7-xmlwriter \
        php7-zlib \
        php7-gd \
        php7-pecl-redis \
        php7-pecl-amqp

WORKDIR /app

CMD ["/usr/bin/php"]