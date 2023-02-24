FROM 	alpine:3.16.4

RUN 	sed -i "s/6/5/g" /etc/apk/repositories
COPY 	./conf/nginx.conf /etc/nginx/nginx.conf
COPY 	./tools/*.html /var/www/
COPY 	./tools/script.sh /

RUN sh ../script.sh


WORKDIR /app
EXPOSE 	443 
CMD 	["nginx", "-g", "daemon off;"]
