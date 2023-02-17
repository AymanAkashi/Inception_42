FROM 	alpine:3.16
COPY 	. /etc/nginx/site-available/default
WORKDIR /app
RUN 	apk update && apk upgrade  && apk add nginx
EXPOSE 	443
CMD 	["/usr/sbin/nginx", "-g", "daemon off;"]
