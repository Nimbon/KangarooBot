#!/bin/sh
sudo apt-get remove mysql* -y
sudo apt-get autoremove -y
sudo apt-get update -y
sudo apt-get dist-upgrade -y
sudo apt-get install lxde-core tightvncserver screen unifont firefox aria2 make nano -y
