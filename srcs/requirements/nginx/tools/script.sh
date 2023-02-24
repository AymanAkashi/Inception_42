#!/bin/sh
apk update && apk upgrade && apk add --no-cache nginx netcat-openbsd bc curl wget git bash openssl libressl php7 php7-fpm php7-opcache
mkdir -p /etc/nginx/ssl
openssl req -x509 -new -newkey rsa:4096 -nodes -keyout /etc/nginx/ssl/aaggoujj.42.fr.key -out /etc/nginx/ssl/aaggoujj.42.fr.crt -subj "/C=MA/ST=/L=/O=/OU=/CN=aaggoujj.42.fr"
