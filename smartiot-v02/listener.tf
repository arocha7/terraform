# Listener

variable "listener_nodes" {
  description = "number of servers:"
  default = 2
}

resource "openstack_compute_instance_v2" "listener" {
  count = "${var.listener_nodes}"
  name = "${format("listener%02d", count.index+1)}"
  image_name = "RancherOS"
  #availability_zone = ""
  flavor_id = "1"
  #key_pair = "${os_keypair}"
  security_groups = ["default"]
  network {
    name = "${var.tenant_network}"
    uuid = "${var.internal_network_id}"
  }
  user_data = "${file("bootstrap-listener-Core.sh")}"
}

resource "template_file" "listener_hosts" {
  count = "${var.listener_nodes}"
  template = "${file("hostname.tpl")}"
  vars {
    index = "${count.index + 1}"
    name  = "listener"
    env   = "qual"
    extra = " ansible_host=${element(openstack_compute_instance_v2.listener.*.access_ip_v4, count.index)}"
  }
}
