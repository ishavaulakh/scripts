#!/bin/bash
cd
mkdir backup
cd backup
echo "Starting Backup"
mysql -N -e 'show databases' | while read dbname; do mysqldump --complete-insert --routines --triggers --single-transaction "$dbname" > "$dbname".sql; [[ $? -eq 0 ]] && gzip "$dbname".sql; done
zip -r sites.zip /var/www/html/
cd
filename=$(date +"%Y-%m-%d.zip")
zip -r ${filename} backup
echo "File Compression Completed"
echo "Starting Transfer"
password="Your Remote server Password goes here"
username="Your Remote server username goes here"
Ip="Remote Server IP or hostname goes here"
sshpass -p "$password" scp ${filename} $username@$Ip:/home/backup/vps_backup/
echo "Transfer Complete"
cd
rm ${filename} 
rm -rf backup/
echo "Waste Files Removed"
