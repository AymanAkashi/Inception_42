FROM alpine:3.16.4

RUN apk add --no-cache curl

RUN curl -OL "https://github.com/portainer/portainer/releases/download/2.17.1/portainer-2.17.1-linux-amd64.tar.gz" && tar -xvf "portainer-2.17.1-linux-amd64.tar.gz"

ENTRYPOINT [ "./portainer/portainer" ]