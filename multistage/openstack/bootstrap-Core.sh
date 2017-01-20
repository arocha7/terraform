#!/bin/bash
sudo yum update
wget https://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-9.noarch.rpm
sudo rpm -ihv epel-release-7-9.noarch.rpm
sudo yum update
sudo yum install ansible -y
sudo yum install git -y
sudo yum install htop nmap sysstat tree -y

# DEPLOY A MULTISTAGE PLATFORM 
git clone https://github.com/arocha7/terraform.git
cd terraform/multistage
./terraform.sh
