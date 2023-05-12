#!/bin/bash
SETUP_OK="/var/www/html/wordpress/.setup_ok"

sleep 7

if [ ! -f "$SETUP_OK" ]; then
	# Check if wp-cli is installed properly
	wp --info
	# Download wordpress core : https://developer.wordpress.org/cli/commands/core/download/
	wp core download --allow-root
	# Create wp-config.php : https://developer.wordpress.org/cli/commands/config/create/
	wp config create --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_USER_PW --dbhost="mariadb" --path="/var/www/html/wordpress/" --allow-root --skip-check
	# Create admin user : https://developer.wordpress.org/cli/commands/core/install/
	wp core install --url=$WP_URL --title=$WP_TITLE --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PW --admin_email=$WP_ADMIN_EMAIL --path="/var/www/html/wordpress/" --allow-root
	# Create normal user : https://developer.wordpress.org/cli/commands/user/create/
	wp user create $WP_USER $WP_USER_EMAIL --role=author --user_pass=$WP_USER_PW --allow-root
	touch $SETUP_OK
fi

exec php-fpm7.3 --nodaemonize