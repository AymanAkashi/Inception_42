#!/bin/sh

if [ ! -f "/var/www/html/index.html" ]; then
	cp /tmp/index.html /var/www/html

	mkdir -p /var/www/html/wordpress
	chmod -R 755 /var/www/html/wordpress
	cd /var/www/html/wordpress

	wp core download --allow-root

	wp config create --dbname=$WP_DB_NAME --dbuser=$WP_ADMIN --dbpass=$WP_ADMIN_PASSWORD --dbhost=$MARIADB_HOSTNAME --allow-root


	wp core install --url=$WP_URL/wordpress --title=$WP_TITLE --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root

	wp user create $WP_USER $WP_USER_EMAIL --role=author --user_pass=$WP_USER_PASSWORD --allow-root

	wp theme install inspiro --activate --allow-root

	# install & config redis
	wp plugin install redis-cache --activate --allow-root

	wp config set "WP_REDIS_HOST" redis --allow-root
	wp config set "WP_REDIS_PORT" 6379 --raw --allow-root
	#reasonable connection and read+write
	wp config set "WP_REDIS_TIMEOUT" 1 --raw --allow-root
	wp config set "WP_REDIS_READ_TIMEOUT" 1 --raw --allow-root
	wp config set "WP_REDIS_DATABASE" 0 --raw --allow-root



	chown -R nginx:nginx /var/www/html
fi

cd /var/www/html/wordpress

wp redis enable --allow-root

wp redis status --allow-root

php-fpm7 -F