#!/bin/bash

#Upgrade OS

upgradeos(){
echo Upgrading operating system before install.
sudo apt update -y && sudo apt upgrade -y
apt install -y zip unzip
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
sudo apt install -y php php-fpm php-common php-cli php-fpm php-json php-pdo php-mysql php-zip php-gd php-mbstring php-curl php-xml php-pear php-bcmath php-imap php-imagick php-intl
}

disable apache2

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

install()
{
upgradeos
disapache
installnginx
instphp
naturalize
instmysql

}

install
