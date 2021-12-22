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
apt-get update
