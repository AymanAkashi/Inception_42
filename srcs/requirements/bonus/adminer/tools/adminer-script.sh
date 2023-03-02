#!/bin/sh

chmod -R 777 /var/www/html
cd /var/www/html


mkdir -p adminer
cd adminer

curl "https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php" --location -o index.php 
curl "https://raw.githubusercontent.com/vrana/adminer/master/designs/mvt/adminer.css" --location -o adminer.css

php -S 0.0.0.0:80