#!/bin/bash

###############################

Autor: Kian Kaufmann
Made: 4.6.2025
Features:

- Time
- Updates
- Package source
- Monitoring
- Logration
- Shell Tools
- hostname

################################

echo "server" > /etc/hostname
hostnamectl set-hostname server
echo "192.168.72.152 server" >> /etc/hosts

add-apt-repository universe
apt update

apt install -y htop vim curl wgetgit bash-completion net-tools unzip

apt install -y chrony
systemctl enable chronyd
systemctl restart chronyd

apt install -y unattended-upgrades
dpkg-reconfigure -f noninteractive unattended-upgrades

apt install -y logrotate
logrotate --debug /etc/logrotate.conf

apt install -y sysstat
sed -i 's/ENABLED="flase"/ENABLED="true"/' /etc/default/sysstat
systemctl enable sysstat
systemctl restart sysstat

