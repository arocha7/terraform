# TENANT AUTH
variable "os_auth_url" {default = "http://172.31.6.4:5000/v2.0"}
variable "os_tenant"   {default = "son-qual"}
variable "os_username" {default = "son-qual"}
variable "os_password" {default = "********"}

# VM
variable "vm_name"     {default = "son-sp4qi"}
variable "img_name"    {default = "trusty-cldimg"}
variable "flv_name"    {default = "m1.small"}
variable "sec_grp"     {default = "son-qual-secgrp"}
variable "key_pair"    {default = "son-ift-ptin"}

# NETW
variable "internal_network_name" {default = "son-qual-netw"}
variable "internal_network_id"   {default = "ffdf5f4f-eeee-49ac-ac34-ccaf814bfb84"}
variable "floatip"               {default = "admin_floating_net"}

# LOCATION
variable "region"            {default = "RegionOne"}
variable "availability_zone" {default = "nova"}
