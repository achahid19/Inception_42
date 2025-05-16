#!/bin/sh

################################################################
# script.sh has to be run by ENTRYPOINT from mariadb Dockerfile
################################################################

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
    # sed -i 's/127.0.0.1/mariadb/' /etc/mysql/mariadb.conf.d/50-server.cnf
    # sed -i 's/user = mysql/user = root/' /etc/mysql/mariadb.conf.d/50-server.cnf
    echo "Inception : ${DB_DATABASE} database is being created."
    envsubst < /etc/mysql/init.sql > /etc/mysql/init_db.sql
fi

# Start MariaDB
exec mysqld

# This change should fix the error by:

# Properly initializing the MySQL system tables using mysql_install_db
# Ensuring proper permissions on the data directory
# Starting MySQL with the correct user
