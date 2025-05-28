#!/bin/bash

mkdir -p /var/www/html/
chown -R www-data:www-data /var/www/html
chmod 755 /var/www/html
cd /var/www/html/

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar

./wp-cli.phar core download --allow-root
./wp-cli.phar config create --dbname=${DB_DATABASE} --dbuser=${DB_USER} --dbpass=${DB_USER_PASSWORD} --dbhost=${DB_HOST} --allow-root
./wp-cli.phar user create ${WP_USER} ${WP_USER_EMAIL} --role=author --user_pass=${WP_USER_PASSWORD} --allow-root
./wp-cli.phar config set WP_REDIS_HOST ${CACHE_HOST} --allow-root
./wp-cli.phar config set WP_REDIS_PORT ${CACHE_PORT} --allow-root
./wp-cli.phar config set WP_CACHE true --allow-root
./wp-cli.phar core install --url=achahid-.42.fr --title=inception --admin_user=${WP_ADMIN} --admin_password=${WP_ADMIN_PASSWORD} --admin_email=${WP_ADMIN_EMAIL} --allow-root

php-fpm7.4 -F
