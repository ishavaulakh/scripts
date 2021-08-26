#!/bin/bash
cd 
echo "$(tput setaf 2)Starting Update process"
sleep 5
apt update -y && apt upgrade -y
sleep 5
apt-get update && apt-get install -y gnupg2 wget lsb-release
echo "$(tput setaf 2)Adding sources for freeswitch"
sleep 5
echo "deb [trusted=yes] http://files.freeswitch.org/repo/deb/debian-release/ `lsb_release -sc` main" > /etc/apt/sources.list.d/freeswitch.list
echo "deb-src [trusted=yes] http://files.freeswitch.org/repo/deb/debian-release/ `lsb_release -sc` main" >> /etc/apt/sources.list.d/freeswitch.list
wget -O - https://files.freeswitch.org/repo/deb/debian-release/fsstretch-archive-keyring.asc | apt-key add -
echo "$(tput setaf 2)Building Switch Dependencies"
sleep 5
apt update -y && apt upgrade -y
apt-get build-dep freeswitch
echo "$(tput setaf 2)Installing freeswitch"
sleep 5
apt-get update && apt-get install -y freeswitch-meta-all
systemctl enable freeswitch
systemctl start freeswitch
echo "$(tput setaf 2)Build complete: System will reboot in 5 seconds."
echo "$(tput setaf 2)Run fs_cli to access switch"
sleep 5
while true; do
    read -p "$(tput setaf 2)It is recommended that you reboot your system now. Do you want to reboot?(Yes/No)" yn
    case $yn in
        [Yy]* ) echo "reboot"; break;;
        [Nn]* ) echo "$(tput setaf 2)Please reboot your system manually before using";exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
