#!/bin/bash

service mysql start

# Create DB
echo "CREATE DATABASE IF NOT EXISTS $DB_NAME DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci" | mysql -u root
# Create user
echo "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_USER_PW'" | mysql -u root
# Authentification granting
echo "GRANT ALL ON $DB_NAME.* TO '$DB_USER'@'%'" | mysql -u root

echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT_PW'" | mysql -u root
echo "FLUSH PRIVILEGES" | mysql -u root -p $DB_ROOT_PW

service mysql stop

# Launch mysql daemon with mysqld (or mysqld_safe for security)
exec /usr/sbin/mysqld -u root