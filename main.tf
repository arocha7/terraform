variable "node_count" {
  default = 10
}

variable "node_name_list" {
  default = {
    "0" = "historydb"
    "1" = "catalogdb"
    "2" = "inputqueue"
    "3" = "deliveryqueue"
    "4" = "listener"
    "5" = "processingworker"
    "6" = "deliveryworker"
    "7" = "retrydeliveryworker"
    "8" = "configserver"
    "9" = "logs"
  }
}

# 'template_file' to generate hostnames
resource "template_file" "smartiot_init" {
  count = "${var.node_count}"
  template = "${file("templates/hostname.tpl")}"
  vars {
    index = "${count.index + 1}"
    name  = "${lookup(var.node_name_list, count.index)}"
    env   = "prd"
    extra = "etc_ansible_host=${element(openstack_compute_instance_v2.smartiot.*.access_ip_v4, count.index)}"
  }
}

# 'template_file' to generate Inventory file
resource "template_file" "etc_ansible_hosts" {
  template = "${file("templates/etc_ansible_hosts.tpl")}"
  vars {
    env            = "prd"
    smartiot_hosts = "${join("\n",template_file.smartiot_init.*.rendered)}"
  }
}

# create SMARTIOT instances
resource "openstack_compute_instance_v2" "smartiot" {
  count = "${var.node_count}"
  name = "${lookup(var.node_name_list, count.index)}"
  image_name = "${var.image}"
  flavor_name = "${var.flavor}"
  #key_pair = "${var.keypair}"
  security_groups = [
    "default"
  ]
  network = {
    name = "net-ptin"
  }
}
