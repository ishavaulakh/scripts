sudo apt update -y && apt upgrade -y
sudo apt install xfce4 xfce4-goodies xorg dbus-x11 x11-xserver-utils xrdp -y
sudo adduser xrdp ssl-cert  
sudo systemctl restart xrdp
sudo apt install -y firefox-esr
sudo ufw allow 3389
