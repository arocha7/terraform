variable "openstack_user_name" {
    description = "The username belonging to a Tenant"
    default  = "son-admin"
}

variable "openstack_tenant_name" {
    description = "The name of the Tenant"
    default = "SON-NFV_QA"
}

variable "openstack_password" {
    description = "The password for the Tenant's user"
    default = "$0nAdm1n"
}

variable "openstack_auth_url" {
    description = "The endpoint url to connect to OpenStack."
    default = "http://10.112.76.200:5000/v2.0"
}
	
variable "keypair" {
    description = "The keypair to be used"
    default = "son-admin"
}

variable "tenant_id" {
    description = "The Tenant ID for SON-NFV_QA"
    default = "7ce53db3704f45b087aad537f34d73c7"
}

variable "tenant-net" {
    description = "The network to be used"
    default = "net-ptin"
}

variable "external-gw" {
  description = "(Optional) The network UUID of an external gateway for the router"
  default = ""
}

variable "pool" {
  description = "The name of the pool from which to obtain the floating IP"
  default = ""
}

variable "image" {
  description = "the name of the Image uploaded to the Registry"
#  default = "centos7-cldimg"
  default = "cirros"
}

variable "flavor" {
  description = "the name of the flavor with allocatates resources"
  default = "m1.small"
}

variable "region_name" {
  description = "Region name"
  default = "RegionOne"
}

variable "node_count" {
  default = 6
}
