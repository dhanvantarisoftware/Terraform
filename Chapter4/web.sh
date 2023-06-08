#!/bin/bash
yum install httpd git -y
service httpd start
cd /opt
wget https://www.tooplate.com/zip-templates/2134_gotto_job.zip
unzip 2134_gotto_job.zip
cp -r 2134_gotto_job/* /var/www/html/
service httpd restart