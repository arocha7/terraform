# AUTH
variable "os_username"   { default = "son-demo" }
variable "os_tenantname" { default = "son-demo" }
variable "os_password"   { default = "S0n-d3m0" }
variable "os_auth_url"   { default = "http://172.31.6.4:5000/v2.0" }

# VM INSTANCE
variable "vm_name"     { default = "vm"}
variable "os_img_id"   { default = "7129fb44-a239-458c-a45f-f93342ed458c" } # Ub14 trusty cld img
#variable "os_img_id"  { default = "fed16665-bed0-46f8-8a95-42801ca9753d" } # Ub16 xenial cld img
#variable "os_img_id"  { default = "b7ae5d8c-8c65-4411-8251-1985d714c2a7" } # Cen7 cld img
variable "os_flv_id"   { default = "2" } # '1'-tiny '2'-m1.small '3'-m1.medium '4'-m1.large '5'-
#variable "os_region"  { default = "" }
variable "os_sec_grp"  { default = "son-demo-secgrp" }
variable "os_key_pair" { default = "son-ift-ptin" }

# NETW
variable "internal_network_id"   { default = "cffedbd8-e2a5-4cc3-92f9-0ce5259e4d31" }
variable "internal_network_name" { default = "son-demo-netw" }

# FLOATING IP
variable "os_fip_pool"  { default = "admin_floating_net" }

# DISTRO
variable "distro" { default = "trusty" } # distros = "trusty | xenial | centos7"

# APP LAYERs
variable "layer" { default = "fe" } # layers = "fe | midtier | be"

# ENVIRONMENTS
variable "env" { default = "demo" } # environ = "int | qual | demo" 
