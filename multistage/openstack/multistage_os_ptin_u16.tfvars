# TENANT AUTH
os_auth_url" {default = "http://172.31.6.9:5000/v2.0"
os_tenant"   {default = "son-qual"
os_username" {default = "son-qual"
os_password" {default = "S0n-Qu@l"

# VM
vm_name  = "qi"
img_name = "xenial-cldimg"
flv_name = "m1.small"
sec_grp  = "qual-secgrp"
key_pair = "son-ift-ptin"
key_path = "~/.ssh/son-ift-ptin.pem"

# NETW
internal_network_name = "qual-netw"
internal_network_id  = "3ef0b481-8c8c-49c7-88f5-10e4d8c5612f" # QUAL NETW

# FIP
floatipnet    = "admin_floating_net"
# floatipaddr = ""

# LOCATION
#region            = "RegionOne"
#availability_zone = "nova"

# TF REMOTE-EXEC
user_distro = "ubuntu"
distro = "xenial"
