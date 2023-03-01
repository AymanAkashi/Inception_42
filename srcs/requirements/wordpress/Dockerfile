FROM alpine:3.16.4

RUN sed -i "s/6/5/g" /etc/apk/repositories
RUN apk add --no-cache curl php7 php7-phar php7-common php7-session php7-iconv php7-json php7-gd php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom php7-simplexml php7 php7-fpm php7-opcache mariadb-client php7-tokenizer

RUN mkdir -p /run/php/

RUN curl -O "https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar" \
	&& chmod +x wp-cli.phar \
	&& mv wp-cli.phar /usr/local/bin/wp

RUN adduser -S nginx && addgroup -S nginx

COPY ./conf/php-fpm.conf /etc/php7/

COPY ./tools/*html /tmp

COPY ./tools/script.sh /tmp


ENTRYPOINT [ "sh","/tmp/script.sh"]

