CREATE DATABASE wordpress;
-- TODO: Move sensitive data to environment variables in .env file 
CREATE USER 'wp-ks'@'%' IDENTIFIED BY '0000';
GRANT ALL PRIVILEGES ON *.* TO 'wp-ks'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;
