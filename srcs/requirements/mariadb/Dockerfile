FROM alpine:3.16.4

RUN apk add --no-cache mariadb mariadb-client openrc
# RUN openrc && touch /run/openrc/softlevel  

COPY ./tools/script.sh /tmp/script.sh
COPY ./conf/my.cnf /etc/my.cnf

ENTRYPOINT [ "sh","/tmp/script.sh" ]