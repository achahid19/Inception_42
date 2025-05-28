#!/bin/sh

mkdir -p /run/mysqld
chown -R mysql:mysql /run/mysqld

# Initialize MySQL data directory
# IN CASE THE VOLUME IS NOT MOUNTED
if [ ! -d "/var/lib/mysql/mysql" ]; then
    echo "Initializing MySQL data directory..."
    mysql_install_db --user=mysql --datadir=/var/lib/mysql
    chown -R mysql:mysql /var/lib/mysql
fi

if [ ! -f "/run/mysqld/mysqld.pid" ]; then
    echo "Inception : ${DB_DATABASE} database is being created."
    envsubst < /etc/mysql/init.sql > /etc/mysql/init_db.sql
fi

# Start MariaDB
exec mysqld
