FROM debian:buster

WORKDIR /
RUN apt -y update && apt -y upgrade && apt install -y mariadb-server

COPY ./tools/script.sh /tmp/script.sh
# COPY 	./conf/my.cnf /etc/mysql/my.cnf

ARG 	SQL_DATABASE \
		SQL_USER \
		SQL_PASSWORD \
		SQL_ROOT_PASSWORD

# RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql
RUN chmod +x /tmp/script.sh

ENTRYPOINT ["/tmp/script.sh" ]
CMD ["mysqld","--user=mysql"] 
# CMD ["/bin/sh"]
