# HistoryDB

variable "deliveryqueue_nodes" {
  description = "number of servers:"
  default = 2
}

resource "openstack_compute_instance_v2" "deliveryqueue" {
  count = "${var.deliveryqueue_nodes}"
  name = "${format("deliveryqueue%02d", count.index+1)}"
  image_name = "RancherOS"
  #availability_zone = ""
  flavor_id = "1"
  #key_pair = "${os_keypair}"
  security_groups = ["default"]
  network {
    name = "${var.tenant_network}"
    uuid = "${var.internal_network_id}"
  }
  user_data = "${file("bootstrap-deliveryqueue-Core.sh")}"
}

resource "template_file" "deliveryqueue_hosts" {
  count = "${var.deliveryqueue_nodes}"
  template = "${file("hostname.tpl")}"
  vars {
    index = "${count.index + 1}"
    name  = "deliveryqueue"
    env   = "qual"
    extra = " ansible_host=${element(openstack_compute_instance_v2.deliveryqueue.*.access_ip_v4, count.index)}"
  }
}
