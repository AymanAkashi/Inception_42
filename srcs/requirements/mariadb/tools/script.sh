#!/bin/sh
if [ ! -d "/var/lib/mysql/mysql" ]; then
    mysql_install_db --user=mysql --datadir=/var/lib/mysql --skip-test-db
    
    mariadbd --bootstrap --user=mysql << EOF

    FLUSH PRIVILEGES;

    ALTER USER 'root'@'localhost' IDENTIFIED BY '$MARIADB_ROOT_PASSWORD';
    
    CREATE DATABASE IF NOT EXISTS $WP_DB_NAME;

    CREATE USER IF NOT EXISTS '$WP_ADMIN'@'%' IDENTIFIED BY '$WP_ADMIN_PASSWORD'; 
    GRANT ALL PRIVILEGES ON $WP_DB_NAME.* TO '$WP_ADMIN'@'%' IDENTIFIED BY '$WP_ADMIN_PASSWORD';

EOF
fi


mariadbd-safe --datadir=/var/lib/mysql
