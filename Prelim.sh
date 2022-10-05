#!/bin/sh
#Regenerate SSH Keys
rm -rf /etc/ssh/ssh_host_*
ssh-keygen -A
service ssh restart
#Add User Nimbon
adduser Nimbon --gecos "" --disabled-password
echo "Nimbon:placeholderpwd" | chpasswd
adduser Nimbon sudo
passwd -l root
passwd -d root
#Remove apt-listchanges
apt-get remove apt-listchanges -y
#Fix Mirrors
cat > /etc/apt/sources.list << SOURCES
deb http://http.debian.net/debian buster main contrib non-free
deb-src http://http.debian.net/debian buster main contrib non-free
deb http://security.debian.org/ buster/updates main contrib non-free
deb-src http://security.debian.org/ buster/updates main contrib non-free
deb http://http.debian.net/debian buster-updates main contrib non-free
deb-src http://http.debian.net/debian buster-updates main contrib non-free
SOURCES
