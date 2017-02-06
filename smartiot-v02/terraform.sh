#!/bin/sh
terraform plan -var-file=salina.tfvars
terraform apply -var-file=salina.tfvars
terraform output smartiot_inventory > hosts
