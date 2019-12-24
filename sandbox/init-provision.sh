#!/usr/bin/env bash

sudo yum install wget -y
sudo yum install curl -y
sudo yum install unzip -y
sudo yum install ansible -y
curl "https://d1vvhvl2y92vvt.cloudfront.net/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
