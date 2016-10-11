# ConfigServer

variable "configserver_nodes" {
  description = "number of servers:"
  default = 2
}

resource "openstack_compute_instance_v2" "configserver" {
  count = "${var.configserver_nodes}"
  name = "${format("configserver%02d", count.index+1)}"
  image_name = "RancherOS"
  #availability_zone = ""
  flavor_id = "1"
  #key_pair = "${os_keypair}"
  security_groups = ["default"]
  network {
    name = "${var.tenant_network}"
    uuid = "${var.internal_network_id}"
  }
  user_data = "${file("bootstrap-configserver-Core.sh")}"
}

resource "template_file" "configserver_hosts" {
  count = "${var.configserver_nodes}"
  template = "${file("hostname.tpl")}"
  vars {
    index = "${count.index + 1}"
    name  = "configserver"
    env   = "qual"
    extra = " ansible_host=${element(openstack_compute_instance_v2.configserver.*.access_ip_v4, count.index)}"
  }
}
