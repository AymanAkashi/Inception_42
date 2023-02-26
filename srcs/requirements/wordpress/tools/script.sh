#!/bin/bash

# change the owner of the directory of /var/www/html and all subdirectoriesf

#changing the owner of /var/www/html/ to 755 
chmod -R 755 /var/www/html/ 

# move to /var/www/html/ directory
cd /var/www/html/

# download wordpress using wp-CLI 
wp core download --allow-root

# create wp-config.php file
wp config create --dbname=mariadb --dbuser=mariadb --dbpass=abcd123 --dbhost=mariadb --allow-root
# touch wp-config.php

# copy the default configuration to wp-config.php
# cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php

# change is modifying the unix socket used for the connection of PHP-FPM with the web server,
# from the default /run/php/php7.3-fpm.sock to TCP/IP port 9000 .
sed -i '36 s/\/run\/php\/php7.3-fpm.sock/9000/' /etc/php/7.3/fpm/pool.d/www.conf

# instal the wordpress
wp core install --url=$DOMAIN_NAME --title="My Wordpress Site" --admin_user=$ADMIN_USER --admin_password=$ADMIN_PASSWORD --admin_email=$ADMIN_EMAIL --skip-email --allow-root

# create second user in wordpress
wp user create $USER $USER_EMAIL --user_pass=$USER_PASSWORD --role='author' --allow-root

php-fpm7 -F