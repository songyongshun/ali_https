#!/bin/bash
# how to use: ./proxy.sh 9xx_url_apache.zip
# zip file is downloaded from aliyun

zip_name=$1
unzip $1

url=`echo $zip_name |awk -F '_' '{print $2}'`
#echo $url

yum -y install httpd
yum -y install mod_ssl

cp /etc/httpd/conf/httpd.conf  /etc/httpd/conf/httpd.conf_bak
cp /etc/httpd/conf.d/ssl.conf  /etc/httpd/conf.d/ssl.conf_bak

sed -i 's/#DocumentRoot/DocumentRoot/g' /etc/httpd/conf.d/ssl.conf
sed -i 's/#ServerName/ServerName/g' /etc/httpd/conf.d/ssl.conf
sed -i "s/www.example.com:443/$url:443\nProxyRequests\ On\nProxyVia\ On/g" /etc/httpd/conf.d/ssl.conf

cp *public.crt /etc/pki/tls/certs/localhost.crt
cp *key /etc/pki/tls/private/localhost.key
