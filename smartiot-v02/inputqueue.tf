# HistoryDB

variable "inputqueue_nodes" {
  description = "number of servers:"
  default = 2
}

resource "openstack_compute_instance_v2" "inputqueue" {
  count = "${var.inputqueue_nodes}"
  name = "${format("inputqueue%02d", count.index+1)}"
  image_name = "RancherOS"
  #availability_zone = ""
  flavor_id = "1"
  #key_pair = "${os_keypair}"
  security_groups = ["default"]
  network {
    name = "${var.tenant_network}"
    uuid = "${var.internal_network_id}"
  }
  user_data = "${file("bootstrap-inputqueue-Core.sh")}"
}

resource "template_file" "inputqueue_hosts" {
  count = "${var.inputqueue_nodes}"
  template = "${file("hostname.tpl")}"
  vars {
    index = "${count.index + 1}"
    name  = "inputqueue"
    env   = "qual"
    extra = " ansible_host=${element(openstack_compute_instance_v2.inputqueue.*.access_ip_v4, count.index)}"
  }
}
