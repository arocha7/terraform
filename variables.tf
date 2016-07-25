variable "openstack_user_name" {
    description = "The username belonging to a Tenant"
    default  = "ci-smartiot"
}

variable "openstack_tenant_name" {
    description = "The name of the Tenant"
    default = "SMARTIOT"
}

variable "openstack_password" {
    description = "The password for the Tenant's user"
    default = "ci-smartiot"
}

variable "openstack_auth_url" {
    description = "The endpoint url to connect to OpenStack."
    default = "http://10.112.223.10:5000/v2.0"
}
	
#variable "keypair" {
#    description = "The keypair to be used"
#    default = ""
#}

variable "tenant_id" {
    description = "The Tenant ID for SMARTIOT"
    default = "66786f52735f46d3a058c0dab9371613"
}

variable "tenant-net" {
    description = "Subnet PTIN: 10.112.224.0/22"
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
  default = "fl.default"
}

variable "region_name" {
  description = "Region name"
  default = "RegionOne"
}

