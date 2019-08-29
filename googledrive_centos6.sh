#!/bin/bash
yum -y install wget unzip curl
wget https://github.com/qt1280/ccaa/archive/master.zip
unzip master.zip && cd ccaa-master && sh ccaa.sh
yum -y install unzip
curl https://rclone.org/install.sh | sudo bash
rclone config
cd /etc/ccaa
wget  https://raw.githubusercontent.com/qt1280/ccaa/master/rcloneupload.sh
chmod +x rcloneupload.sh
echo "on-download-complete=/etc/ccaa/rcloneupload.sh"
chmod +x /etc/rc.d/rc.local
echo "/usr/sbin/ccaa start" >> /etc/rc.d/rc.local

