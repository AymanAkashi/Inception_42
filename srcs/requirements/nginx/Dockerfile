FROM 	alpine:3.16
RUN 	apk update && apk upgrade && apk add nginx netcat-openbsd bc curl wget git bash openssl libressl --no-cache

COPY 	./conf/nginx.conf /etc/nginx/nginx.conf
COPY 	./tools/index.html /usr/share/nginx/html/
COPY 	./tools/script.sh /

RUN sh ../script.sh


WORKDIR /app
EXPOSE 	443 
CMD 	["nginx", "-g", "daemon off;"]
