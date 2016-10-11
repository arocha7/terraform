# LOGs

variable "logs_nodes" {
  description = "number of servers:"
  default = 2
}

resource "openstack_compute_instance_v2" "logs" {
  count = "${var.logs_nodes}"
  name = "${format("logs%02d", count.index+1)}"
  image_name = "RancherOS"
  #availability_zone = ""
  flavor_id = "2"
  #key_pair = "${os_keypair}"
  security_groups = ["default"]
  network {
    name = "${var.tenant_network}"
    uuid = "${var.internal_network_id}"
  }
  user_data = "${file("bootstrap-logs-Core.sh")}"
}

resource "template_file" "logs_hosts" {
  count = "${var.logs_nodes}"
  template = "${file("hostname.tpl")}"
  vars {
    index = "${count.index + 1}"
    name  = "logs"
    env   = "qual"
    extra = " ansible_host=${element(openstack_compute_instance_v2.logs.*.access_ip_v4, count.index)}"
  }
}
