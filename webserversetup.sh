#!/bin/bash

#Upgrade OS

upgradeos(){
echo Upgrading operating system before install.
sudo apt update -y && sudo apt upgrade -y
apt install -y zip unzip
}

##install postgres

instpostgres(){
sudo apt install -y postgresql postgresql-contrib
}

#Install MySQL

instmysql(){
echo Installing MySql
sudo apt install -y mariadb-server mariadb-client
echo Securing MySql
mysql_secure_installation
}

#Install php

instphp(){
echo Installing PHP
sudo apt install -y php libapache2-mod-php php-fpm php-common php-cli php-fpm php-json php-pdo php-mysql php-pgsql php-zip php-gd php-mbstring php-curl php-xml php-pear php-bcmath php-imap php-imagick php-intl php-gd php-mysql php-xmlrpc php-pear php-cli php-apcu php-curl php-xml libapache2-mod-php
}

#disable apache2

disapache()
{
systemctl disable apache2
systemctl stop apache2
apt remove -y apache2
sudo apt-get purge apache2 apache2-utils apache2.2-bin apache2-common -y
sudo apt-get autoremove -y
}

# install nginx
installnginx()
{
apt install -y nginx
}

# normalize ww folder
naturalize()
{
find /var/www/ -type d -exec chmod 755 {} \;
find /var/www/ -type f -exec chmod 644 {} \;
chown -R $USER:$USER /var/www/
}

# install certbot for let's encrypt
instcertbot()
{
sudo apt install -y certbot python3-certbot-nginx
}

install()
{
upgradeos
disapache
installnginx
instphp
naturalize
instcertbot
instpostgres
instmysql
}

install
