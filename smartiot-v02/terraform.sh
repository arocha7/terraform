#!/bin/sh
terraform plan
terraform apply
terraform output smartiot_inventory > hosts
