#!/bin/sh

echo  "[mysqld]" >> /etc/mysql/my.cnf
echo "socket=/var/run/mysqld/mysqld.sock" >> /etc/mysql/my.cnf
echo "[client]" >> /etc/mysql/my.cnf
echo "socket=/var/run/mysqld/mysqld.sock" >> /etc/mysql/my.cnf
service mysql restart
# mysql_secure_installation
mkdir -p /var/run/mysqld
chown -R mysql /run/mysqld
chown -R mysql:mysql /var/lib/mysql /var/log/mysql


sed -i "s|bind-address=       127.0.0.1|bind-address=           0.0.0.0" /etc/mysql/mariadb.conf.d/50-server.cnf
mysql_install_db --user=mysql --datadir=/var/lib/mysql --skip-test-db

service mariadb start

if [ ! -d "/var/lib/mysql/$SQL_DATABASE" ]
then
    mysql -u root -e "CREATE DATABASE IF NOT EXISTS $SQL_DATABASE; GRANT ALL ON $SQL_DATABASE.* TO '$SQL_USER'@'%' IDENTIFIED BY '$SQL_PASSWORD';"
    mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"
    mysql -u root -e "FLUSH PRIVILEGES;"
fi

mysqld --user=mysql


# if [ ! -d "/var/lib/mysql/mysql" ]; then

#         chown -R mysql:mysql /var/lib/mysql

#         mysql_install_db --basedir=/usr --datadir=/var/lib/mysql --user=mysql --rpm
# fi

# if [ ! -d "/var/lib/mysql/wordpress" ]; then

#         cat << EOF > /tmp/create_db.sql
# USE mysql;
# FLUSH PRIVILEGES;
# DELETE FROM     mysql.user WHERE User='';
# DROP DATABASE test;
# DELETE FROM mysql.db WHERE Db='test';
# DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
# ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_DATABASE}';
# CREATE DATABASE ${SQL_DATABASE} CHARACTER SET utf8 COLLATE utf8_general_ci;
# CREATE USER '${SQL_USER}'@'%' IDENTIFIED by '${SQL_PASSWORD}';
# GRANT ALL PRIVILEGES ON ${SQL_DATABASE}.* TO '${SQL_USER}'@'%';
# FLUSH PRIVILEGES;
# EOF
#         /usr/bin/mysqld --user=mysql --bootstrap < /tmp/create_db.sql
#         rm -f /tmp/create_db.sql
# fi
