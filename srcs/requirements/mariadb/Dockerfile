FROM alpine:3.16.4

RUN apk add mariadb mariadb-client openrc
# RUN openrc && touch 

COPY ./tools/script.sh /tmp/script.sh
COPY ./conf/my.cnf /etc/my.cnf

ENTRYPOINT [ "/tmp/script.sh" ]