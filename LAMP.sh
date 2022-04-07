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
sudo apt install -y php libapache2-mod-php php-fpm php-common php-cli php-fpm php-json php-pdo php-mysql php-zip php-gd php-mbstring php-curl php-xml php-pear php-bcmath php-imap php-imagick php-intl
}

#Install apache2

instapache()
{
apt install -y apache2
}


# normalize www folder
naturalize()
{
chown -R www-data:www-data /var/www/
find /var/www/ -type d -exec chmod 755 {} \;
find /var/www/ -type f -exec chmod 644 {} \;
}

install()
{
upgradeos
instapache
instphp
naturalize
instmysql

}

install
