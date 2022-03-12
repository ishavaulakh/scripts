#!/bin/bash
# Take input of domain name
#Upgrade OS
upgradeos(){
echo Upgrading operating system before install.
sudo apt update -y && sudo apt upgrade -y
}
#Install MySQL
instmysql(){
echo Installing MySql
sudo apt install -y mariadb-server mariadb-client
echo Securing MySql
}

#Install php
instphp(){
echo Installing PHP
sudo apt install -y php libapache2-mod-php php-cli php-fpm php-json php-pdo php-mysql php-zip php-gd php-mbstring php-curl php-xml php-pear php-bcmath php-imap php-dbase php-libsodium php-mcrypt php-gmp php-symfony-finder php-symfony-proxy-manager-bridge
  php-symfony-console php-imagick php-twig-doc php-recode php-gd2 php-pragmarx-google2fa-qrcode php-samyoul-u2f-php-server php-mcrypt php-bz2 php-google-recaptcha php-mariadb-mysql-kbs php-phpmyadmin-motranslator php-phpmyadmin-shapefile php-phpmyadmin-sql-parser
  php-phpseclib php-psr-cache php-psr-container php-psr-log php-symfony-cache php-symfony-cache-contracts php-symfony-config
  php-symfony-dependency-injection php-symfony-expression-language php-symfony-filesystem php-symfony-service-contracts
  php-symfony-var-exporter php-symfony-yaml php-tcpdf php-twig php-twig-i18n-extension

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

# fix permissions
naturalize()
{
chown -R www-data:www-data /var/www/
find /var/www/html/ -type d -exec chmod 755 {} \;
find /var/www/html/ -type f -exec chmod 644 {} \;
}


#start installation
startinstall()
{
upgradeos
disapache
instphp
installnginx
instmysql
naturalize
mysql_secure_installation

}
startinstall

