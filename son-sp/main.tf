variable "node_count" {
  default = 2
}


# create SMARTIOT instances
resource "openstack_compute_instance_v2" "son-sp4qi" {
  count = "${var.node_count}"
  #name = "${lookup(var.node_name_list, count.index)}"
  name = "son-sp4qi-${count.index}"
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
