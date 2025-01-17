#!/bin/bash

#Upgrade OS

upgradeos(){
echo Upgrading operating system before install.
sudo apt update -y && sudo apt upgrade -y
sudo apt install -y zip unzip wget
}

#Install MySQL

instmysql(){
echo Installing MySql
sudo apt install -y mariadb-server mariadb-client
echo Securing MySql
sudo mysql_secure_installation
}

#Install php

instphp(){
echo Installing PHP
sudo apt install -y php libapache2-mod-php php-fpm php-common php-cli php-fpm php-json php-pdo php-mysql php-pgsql php-zip php-gd php-mbstring php-curl php-xml php-pear php-bcmath php-imap php-imagick php-intl php-gd php-mysql php-xmlrpc php-pear php-cli php-apcu php-curl php-xml libapache2-mod-php
}

#Install apache2

instapache()
{
sudo apt install -y apache2
}


# normalize www folder
naturalize()
{
sudo find /var/www/ -type d -exec chmod 755 {} \;
sudo find /var/www/ -type f -exec chmod 644 {} \;
sudo chown -R $USER:$USER /var/www/
}

#install certbot
certbot()
{
sudo apt install python3-certbot-apache
}

#install phpmyadmin
phpmyadmin()
{
sudo apt install phpmyadmin -y
}

install()
{
upgradeos
instapache
instphp
naturalize
certbot
instmysql
phpmyadmin
}

install
