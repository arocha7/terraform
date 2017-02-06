# ProcessingWorker

variable "processingworker_nodes" {
  description = "number of servers:"
  default = 2
}

resource "openstack_compute_instance_v2" "processingworker" {
  count = "${var.processingworker_nodes}"
  name = "${format("processingworker%02d", count.index+1)}"
  image_name = "centos7-cldimg"
  #availability_zone = ""
  flavor_id = "1"
  #key_pair = "${os_keypair}"
  security_groups = ["default"]
  network {
    name = "${var.tenant_network}"
    uuid = "${var.internal_network_id}"
  }
  user_data = "${file("bootstrap-processingworker-Core.sh")}"
}

resource "template_file" "processingworker_hosts" {
  count = "${var.processingworker_nodes}"
  template = "${file("hostname.tpl")}"
  vars {
    index = "${count.index + 1}"
    name  = "processingworker"
    env   = "qual"
    extra = " ansible_host=${element(openstack_compute_instance_v2.processingworker.*.access_ip_v4, count.index)}"
  }
}
