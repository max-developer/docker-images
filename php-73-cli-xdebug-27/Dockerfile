FROM php:7.3

# Install PECL extensions
RUN docker-php-ext-install mysqli

ARG INSTALL_XDEBUG=false

RUN if [ ${INSTALL_XDEBUG} = true ]; then \
  pecl install xdebug-2.7.0RC1 && \
  docker-php-ext-enable xdebug \
;fi