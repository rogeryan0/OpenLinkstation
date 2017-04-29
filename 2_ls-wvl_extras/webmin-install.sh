#!/bin/sh

# install webmin - administrative software accessed from the web
# after installation access the utility @ http://{hostname}:10000/
#
# Author: David Slama
# Date: 09/11/2015
#
# Credit:
#     http://www.webmin.com/deb.html

CD=$(pwd)
cd ~/

echo "Installing Webmin (this may take some time)"
# backup apt sources list
cp /etc/apt/sources.list /etc/apt/sources.list.old
# install new sources
echo "deb http://download.webmin.com/download/repository sarge contrib" >> /etc/apt/sources.list
echo "deb http://webmin.mirror.somersettechsolutions.co.uk/repository sarge contrib" >> /etc/apt/sources.list
# download key
wget http://www.webmin.com/jcameron-key.asc
# install key
apt-key add jcameron-key.asc 
sleep 1
# remove key
rm jcameron-key
apt-get update
# final install
apt-get install -y webmin
# return to previous directory
cd $CD