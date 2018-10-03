#!/bin/sh
#Regenerate SSH Keys
rm -rf /etc/ssh/ssh_host_*
ssh-keygen -A
service ssh restart
#Remove apt-listchanges
apt-get remove apt-listchanges -y
#Fix Mirrors
cat > /etc/apt/sources.list << SOURCES
deb http://http.debian.net/debian stretch main contrib non-free
deb-src http://http.debian.net/debian stretch main contrib non-free
deb http://security.debian.org/ stretch/updates main contrib non-free
deb-src http://security.debian.org/ stretch/updates main contrib non-free
deb http://http.debian.net/debian stretch-updates main contrib non-free
deb-src http://http.debian.net/debian stretch-updates main contrib non-free
SOURCES
#Update System First
apt-get update && apt-get dist-upgrade -y
#Install Basic Essentials
apt-get install sudo fail2ban screen -y
#Create Swap
dd if=/dev/zero of=/swapfile bs=64M count=16
mkswap /swapfile
chmod 0600 /swapfile
swapon /swapfile
echo "/swapfile          none            swap    defaults        0 0" >> /etc/fstab
#Install Basic GUI and tools
apt-get install lxde-core -y
apt-get install tightvncserver firefox-esr aria2 unifont unrar unzip putty p7zip vnstat cpulimit par2 -y
