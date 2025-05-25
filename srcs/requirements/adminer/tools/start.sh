#!/bin/bash

wget https://github.com/vrana/adminer/releases/download/v5.3.0/adminer-5.3.0.php -O /var/www/html/adminer.php
chmod 755 /var/www/html/adminer.php

# Start the php server
php -S 0.0.0.0:8080 -t /var/www/html
