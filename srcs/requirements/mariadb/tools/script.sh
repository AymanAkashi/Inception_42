#!/bin/sh

mkdir /var/run/mysqld
chown -R mysql /var/run/mysqld
chmod 777 /var/run/mysqld
sed -i "s|bind-address            = localhost|bind-address            = 0.0.0.0|g" /etc/mysql/mariadb.conf.d/50-server.cnf
mysql_install_db --user=mysql --datadir=/var/lib/mysql --skip-test-db

service mariadb start

if [ ! -d "/var/lib/mysql/$SQL_DATABASE" ]
then
    mysql -u root -e "CREATE DATABASE IF NOT EXISTS $SQL_DATABASE; GRANT ALL ON $SQL_DATABASE.* TO '$MYSQL_USER'@'' IDENTIFIED BY '$MYSQL_PASSWORD';"
    mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"
    mysql -u root -e "FLUSH PRIVILEGES;"
fi

mysqld --user=mysql

