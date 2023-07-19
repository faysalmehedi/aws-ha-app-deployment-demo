#!/bin/bash
sudo su
yum update -y
yum install -y httpd
cd /var/www/html
wget "https://github.com/EmAdd9/main.zip"
unzip main.zip
cp -r jupiter-main/* /var/www/html/
rm -rf jupiter-main main.zip
systemctl enable httpd
systemctl start httpd
