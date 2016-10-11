variable "os_user_name" {
    description = "The username for the Tenant."
    #default  = "smartiot"
    default  = "son-demo"
}

variable "os_tenant_name" {
    description = "The name of the Tenant."
    #default  = "APTECIES"
    default  = "son-demo"
}

variable "os_password" {
    description = "The password for the Tenant."
    #default  = "Sm@rt10t"
    default  = "S0n-d3m0"
}

variable "os_auth_url" {
    description = "The endpoint url to connect to OpenStack."
    #default  = "http://10.112.223.10:5000/v2.0"
    default  = "http://172.31.6.4:5000/v2.0"
}

#variable "os_keypair" {
#    description = "The keypair to be used."
#    default  = "son-ift-ptin"
#}

variable "tenant_network" {
    description = "The network to be used."
    #default  = "net-ptin"
    default  = "son-demo-netw"
}

variable "internal_network_id" {
    description = "The network ID to be used."
    #default  = "c39f9a81-ec4e-472d-978c-ace5cc8d4d87"
    default  = "cffedbd8-e2a5-4cc3-92f9-0ce5259e4d31"
}

