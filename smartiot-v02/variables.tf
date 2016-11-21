variable "os_user_name" {
    description = "The username for the Tenant."
    default  = ""
}

variable "os_tenant_name" {
    description = "The name of the Tenant."
    default  = ""
}

variable "os_password" {
    description = "The password for the Tenant."
    default  = ""
}

variable "os_auth_url" {
    description = "The endpoint url to connect to OpenStack."
    default  = ""
}

variable "os_keypair" {
    description = "The keypair to be used."
    default  = ""
}

variable "tenant_network" {
    description = "The network to be used."
    default  = ""
}

variable "internal_network_id" {
    description = "The internal network ID to be used."
    default  = ""
}

