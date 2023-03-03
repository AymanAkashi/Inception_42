FROM alpine:3.16.4

RUN apk add --no-cache vsftpd

COPY ./tools/ftp-script.sh /tmp

ENTRYPOINT [ "/tmp/ftp-script.sh" ]