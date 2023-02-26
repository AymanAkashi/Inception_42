#!/bin/sh
apk add --no-cache nginx openssl
mkdir -p /etc/nginx/ssl
openssl req -x509 -new -newkey rsa:4096 -nodes -keyout /etc/nginx/ssl/aaggoujj.key -out /etc/nginx/ssl/aaggoujj.crt -subj "/C=MA/ST=/L=/O=/OU=/CN=aaggoujj.42.fr"
