FROM nginx:alpine

LABEL maintainer="Mahmoud Zalt <mahmoud@zalt.me>"

COPY nginx.conf /etc/nginx/
COPY templates /etc/nginx/templates/
COPY sites/default.conf /etc/nginx/sites-available/default.conf

ADD startup.sh /opt/startup.sh
ADD template.sh /opt/template.sh
ADD docker-nginx-sites.ini /docker-nginx-sites.ini
ADD docker-nginx-upstream.ini /docker-nginx-upstream.ini

RUN apk update \
    && apk upgrade \
    && apk add --no-cache openssl \
    && apk add --no-cache bash \
    && adduser -D -H -u 1000 -s /bin/bash www-data

RUN sed -i 's/\r//g' /opt/startup.sh
CMD ["/bin/bash", "/opt/startup.sh"]

EXPOSE 80 443
