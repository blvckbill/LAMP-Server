#!/bin/bash

# This is a script to set up a LAMP server

echo "\n--------Updating apt packages-------\n"
sudo apt-get update -y
echo "\n--------Upgrading apt packages-------\n"
sudo apt-get upgrade -y

echo "\nInstalling Apache2 Web Server\n"
sudo apt-get install apache2 -y

echo "\nAdjusting firewall settings to allow both https traffic and TSL/SSL Encrypted traffic\n"
sudo ufw app list

sudo ufw allow in "Apache Full"

echo "\n------------Installing MySQL---------------"
sudo apt-get mysql-server mysql-client -y

echo "\n-------------------Installing PHP--------------------/n"
sudo apt-get install php libapache2-mod-php php-mysql

echo  "\n\n------------------Setting Permissions for /var/www------------------\n"
sudo chown -R www-data:www-data /var/www
echo "\n\n -----------------Permissions have been set---------------------\n"

echo "\n----------------Enabling Modules-----------------------------\n"
sudo a2enmod rewrite
sudo phpenmod mcrypt

echo "\n---------------------------Restarting Apache-----------------\n"
sudo systemctl restart apache2

echo "\n--------------------------Installation Completed---------------------\n"

exit 0
