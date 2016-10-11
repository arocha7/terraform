# RetryDeliveryrWworker

variable "retrydeliveryworker_nodes" {
  description = "number of servers:"
  default = 2
}

resource "openstack_compute_instance_v2" "retrydeliveryworker" {
  count = "${var.retrydeliveryworker_nodes}"
  name = "${format("retrydeliveryworker%02d", count.index+1)}"
  image_name = "RancherOS"
  #availability_zone = ""
  flavor_id = "1"
  #key_pair = "${os_keypair}"
  security_groups = ["default"]
  network {
    name = "${var.tenant_network}"
    uuid = "${var.internal_network_id}"
  }
  user_data = "${file("bootstrap-retrydeliveryworker-Core.sh")}"
}

resource "template_file" "retrydeliveryworker_hosts" {
  count = "${var.retrydeliveryworker_nodes}"
  template = "${file("hostname.tpl")}"
  vars {
    index = "${count.index + 1}"
    name  = "retrydeliveryworker"
    env   = "qual"
    extra = " ansible_host=${element(openstack_compute_instance_v2.retrydeliveryworker.*.access_ip_v4, count.index)}"
  }
}
