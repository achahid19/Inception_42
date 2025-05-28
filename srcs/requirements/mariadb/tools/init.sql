-- TODO: Secure hardcoded credentials
CREATE DATABASE ${DB_DATABASE};
CREATE USER '${DB_USER}'@'%' IDENTIFIED BY '${DB_USER_PASSWORD}';
ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PASSWORD}';
GRANT ALL PRIVILEGES ON *.* TO '${DB_USER}'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;

-- 'localhost' -> user can only connect from the same machine.
-- '%' -> user can connect from any remote IP (wildcard).
