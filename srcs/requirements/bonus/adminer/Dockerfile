FROM alpine:3.16.4


RUN sed -i "s/6/5/g" /etc/apk/repositories

RUN apk add --no-cache curl php7 php7-mysqli php7-pdo_mysql

COPY ./tools/adminer-script.sh /tmp/adminer-script.sh

ENTRYPOINT [ "./tmp/adminer-script.sh" ]

