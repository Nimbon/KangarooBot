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
