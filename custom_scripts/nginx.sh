#!/bin/bash
yum update -y 
sudo amazon-linux-extras install nginx1 -y
sudo systemctl enable nginx
sudo systemctl start nginx

aws s3 cp --recursive s3://code-bucket-repo /usr/share/nginx/html/

