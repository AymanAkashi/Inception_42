FROM 	alpine:3.16.4

COPY 	./conf/nginx.conf /etc/nginx/nginx.conf

COPY 	./tools/script.sh /

RUN 	sh ../script.sh


WORKDIR /app
EXPOSE 	443 
CMD 	["nginx", "-g", "daemon off;"]
