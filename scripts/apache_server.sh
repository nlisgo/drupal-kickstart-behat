#!/usr/bin/env bash

# Install everything

# Configure Apache
WEBROOT="$(pwd)/kickstart"
CGIROOT=`dirname "$(which php-cgi)"`
LOGROOT="$(pwd)/logs"
echo "WEBROOT: $WEBROOT"
echo "CGIROOT: $CGIROOT"
echo "LOGROOT: $LOGROOT"
sudo echo "<VirtualHost *:80>
        DocumentRoot $WEBROOT
        <Directory />
                Options FollowSymLinks
                AllowOverride All
        </Directory>
        <Directory $WEBROOT >
                Options Indexes FollowSymLinks MultiViews
                AllowOverride All
                Order allow,deny
                allow from all
        </Directory>

    # Configure PHP as CGI
    ScriptAlias /local-bin $CGIROOT
    DirectoryIndex index.php index.html
    AddType application/x-httpd-php5 .php
    Action application/x-httpd-php5 '/local-bin/php-cgi'

    ErrorLog $LOGROOT/apache.error.log
    CustomLog $LOGROOT/apache.access.log common
    php_flag log_errors on
    php_flag display_errors on
    php_value error_reporting 30719
    php_value error_log $LOGROOT/php.error.log

</VirtualHost>" | sudo tee /etc/apache2/sites-available/default > /dev/null
cat /etc/apache2/sites-available/default

sudo a2enmod rewrite
sudo a2enmod actions
sudo service apache2 restart

# Configure custom domain
echo "127.0.0.1 localhost" | sudo tee --append /etc/hosts
