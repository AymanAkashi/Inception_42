FROM debian:buster

WORKDIR /
RUN apt -y update && apt -y upgrade && apt install -y mariadb-server mariadb-client
COPY ./tools/script.sh /
COPY 	./conf/my.cnf /etc/mysql/

RUN chmod +x script.sh

# CMD ["sh", "script.sh"]
