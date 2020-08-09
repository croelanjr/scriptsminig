#!/bin/sh

echo "*********************************************************************"
echo "***	CONFIGURATION INCREASE VIRTUAL MEMORY IN CENTOS 8	        ***"
echo "*********************************************************************"

echo "Increase a 16GB"
fallocate -l 16G /var/swapfile
sleep 2
echo "Active permission file"
chmod 600 /var/swapfile
sleep 2
echo "Active permision folder and file"
mkswap /var/swapfile
sleep 2
echo "Active swapon file"
swapon /var/swapfile
sleep 2
free -m
sleep 2
echo "/var/swapfile  none   swap    sw   0    0" >> /etc/fstab
sleep 2
echo "Reboot computer..."
sleep 2
reboot