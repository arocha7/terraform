# CatalogDB

variable "catalogdb_nodes" {
  description = "number of servers:"
  default = 2
}

resource "openstack_compute_instance_v2" "catalogdb" {
  count = "${var.catalogdb_nodes}"
  name = "${format("catalogdb%02d", count.index+1)}"
  image_name = "centos7-cldimg"
  #availability_zone = ""
  flavor_id = "1"
  #key_pair = "${os_keypair}"
  security_groups = ["default"]
  network {
    name = "${var.tenant_network}"
    uuid = "${var.internal_network_id}"
  }
  user_data = "${file("bootstrap-catalogdb-Core.sh")}"
}

resource "template_file" "catalogdb_hosts" {
  count = "${var.catalogdb_nodes}"
  template = "${file("hostname.tpl")}"
  vars {
    index = "${count.index + 1}"
    name  = "sp"
    env   = "qual"
    extra = " ansible_host=${element(openstack_compute_instance_v2.catalogdb.*.access_ip_v4, count.index)}"
  }
}
