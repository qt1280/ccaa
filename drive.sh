#!/bin/bash
yum -y update
yum -y install epel-release
yum -y install wget git unzip gcc gcc-c++ openssl-devel nginx

systemctl start nginx
systemctl enable nginx.service
systemctl stop firewalld # 关闭防火墙

wget -N --no-check-certificate https://raw.githubusercontent.com/ToyoDAdoubi/doubi/master/aria2.sh && chmod +x aria2.sh && bash aria2.sh

mkdir -p /data/Download


mkdir -p /data/www/ariang
cd /data/www/ariang
wget https://github.com/mayswind/AriaNg-DailyBuild/archive/master.zip && unzip master.zip
mv AriaNg-DailyBuild-master/* .
rm -rf master.zip AriaNg-DailyBuild-master

cd /etc/nginx/conf.d
touch ariang.conf

myip=`wget http://ipecho.net/plain -O - -q echo`

echo "server {
    listen 80;
    myip;

    location / {
        root   /data/www/ariang;
        index  index.html index.htm;
    }
}"



yum -y install unzip fuse


curl https://rclone.org/install.sh | sudo bash

mkdir -p /data/GoogleDrive

rclone mount joe1280:alishare /data/GoogleDrive --allow-other --allow-non-empty --vfs-cache-mode writes &

df -h


wget https://raw.githubusercontent.com/qt1280/ccaa/master/rcloned

mv rcloned /etc/init.d/rcloned
chmod +x /etc/init.d/rcloned
vim /etc/rc.d/rc.local #在末尾加入 bash /etc/init.d/rcloned start
chmod +x /etc/rc.d/rc.local

bash /etc/init.d/rcloned status



wget https://raw.githubusercontent.com/qt1280/ccaa/master/rcloneupload.sh

chmod +x /root/rcloneupload.sh

echo "on-download-complete=/root/rcloneupload.sh"  >> /root/.aria2/aria2.conf

cd /data/GoogleDrive
touch codesofun.txt