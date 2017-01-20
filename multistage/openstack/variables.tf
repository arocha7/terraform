# TENANT AUTH
variable "os_auth_url" {default = "http://172.31.6.9:5000/v2.0"}
variable "os_tenant"   {default = "son-qual"}
variable "os_username" {default = "son-qual"}
variable "os_password" {default = "S0n-Qu@l"}

# VM
variable "vm_name"     {default = "qi"}
variable "img_name"    {default = "centos7-cldimg"}
variable "flv_name"    {default = "m1.small"}
variable "sec_grp"     {default = "qual-secgrp"}
variable "key_pair"    {default = "son-ift-ptin"}

# NETW
variable "internal_network_name" {default = "qual-netw"}
variable "internal_network_id"  {default = "3ef0b481-8c8c-49c7-88f5-10e4d8c5612f"} # QUAL NETW

# FIP
variable "floatipnet"            {default = "admin_floating_net"}
#variable "floatipaddr"           {default = ""}

# LOCATION
#variable "region"            {default = "RegionOne"}
#variable "availability_zone" {default = "nova"}

