#!/bin/bash

#Upgrade OS

upgradeos(){
echo Upgrading operating system before install.
sudo apt update -y && sudo apt upgrade -y
sudo apt install -y zip unzip
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

#Install apache2

instapache()
{
apt install -y apache2
}


# normalize www folder
naturalize()
{
find /var/www/ -type d -exec chmod 755 {} \;
find /var/www/ -type f -exec chmod 644 {} \;
chown -R $USER:$USER /var/www/
}

#install certbot
certbot()
{
sudo apt install -y snapd snap
sudo snap install core; sudo snap refresh core
sudo snap install --classic certbot
sudo ln -s /snap/bin/certbot /usr/bin/certbot
}


install()
{
upgradeos
instapache
instphp
naturalize
certbot
instmysql

}

install
