#!/bin/bash
sudo apt-get install software-properties-common -y
sudo apt-add-repository ppa:ansible/ansible
sudo apt-get update
sudo apt-get install ansible -y
sudo apt-get install git -y
sudo apt-get install htop nmap sysstat tree -y

# DEPLOY PGSQL
ansible-playbook ~/son-install/utils/deploy-pgsql.yml -e target=localhost
