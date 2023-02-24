#!/bin/sh
if [ ! -d "/var/lib/mysql/mysql" ]; then
    mysql_install_db --user=mysql --datadir=/var/lib/mysql
    
    mariadbd --bootstrap --user=mysql << EOF

    FLUSH PRIVILEGES;

    ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';
    
    CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;

    CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD'; 
    GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';

EOF
fi


mariadbd-safe --datadir=/var/lib/mysql
