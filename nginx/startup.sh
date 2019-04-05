#!/bin/bash

if [[ -f /etc/nginx/conf.d/default.conf ]]; then
    rm /etc/nginx/conf.d/default.conf
fi;

if [[ ! -d /etc/nginx/ssl ]]; then
    mkdir /etc/nginx/ssl
fi

if [[ ! -f /etc/nginx/ssl/default.crt ]]; then
    openssl genrsa -out "/etc/nginx/ssl/default.key" 2048
    openssl req -new -key "/etc/nginx/ssl/default.key" -out "/etc/nginx/ssl/default.csr" -subj "/CN=default/O=default/C=UK"
    openssl x509 -req -days 365 -in "/etc/nginx/ssl/default.csr" -signkey "/etc/nginx/ssl/default.key" -out "/etc/nginx/ssl/default.crt"
fi

/bin/bash /opt/template.sh /docker-nginx-sites.ini /etc/nginx/sites-available default
/bin/bash /opt/template.sh /docker-nginx-upstream.ini /etc/nginx/conf.d upstream

nginx
