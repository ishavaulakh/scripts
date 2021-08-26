#!/bin/bash
cd 
echo "Starting Update process"
apt update -y && apt upgrade -y
apt-get update && apt-get install -y gnupg2 wget lsb-release
echo "Adding sources for freeswitch"
echo "deb [trusted=yes] http://files.freeswitch.org/repo/deb/debian-release/ `lsb_release -sc` main" > /etc/apt/sources.list.d/freeswitch.list
echo "deb-src [trusted=yes] http://files.freeswitch.org/repo/deb/debian-release/ `lsb_release -sc` main" >> /etc/apt/sources.list.d/freeswitch.list
wget -O - https://files.freeswitch.org/repo/deb/debian-release/fsstretch-archive-keyring.asc | apt-key add -
echo "Building Switch Dependencies"
apt update -y && apt upgrade -y
apt-get build-dep freeswitch
echo "Installing freeswitch"
apt-get update && apt-get install -y freeswitch-meta-all
systemctl enable freeswitch
systemctl start freeswitch
echo "Build complete: System will reboot now."
echo "Run fs_cli to access switch"
systemctl reboot
