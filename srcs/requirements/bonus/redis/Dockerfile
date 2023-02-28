FROM alpine:3.16.4

RUN apk --update add redis


RUN sed -i "s/^protected-mode yes/protected-mode no/" /etc/redis.conf \
	&& sed -i 's/bind 127.0.0.1/bind 0.0.0.0/g' /etc/redis.conf \
	&& sed -i "s/^# maxmemory <bytes>/maxmemory 256mb/" /etc/redis.conf \
	&& sed -i "s/^# maxmemory-policy noeviction/maxmemory-policy allkeys-lru/" /etc/redis.conf \
	&& echo "protected-mode no" >> /etc/redis.conf && echo  "port 6379" >> /etc/redis.conf && echo  "loglevel notice" >> /etc/redis.conf && echo  "logfile /var/log/redis/redis.log" >> /etc/redis.conf

EXPOSE 6379

CMD [ "/etc/redis.conf" ]
ENTRYPOINT [ "redis-server" ]