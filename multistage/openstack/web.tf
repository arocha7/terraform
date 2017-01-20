#
variable "web_node_count" {
  default = 2
}

resource "openstack_compute_floatingip_v2" "jkfip" {
    region = ""
    pool = "${var.floatipnet}"
    count = "${var.web_node_count}"
}
 
resource "openstack_compute_instance_v2" "web" {
  count = "${var.web_node_count}"
  region = ""
  name = "web${format("%02d",count.index)}"
  image_name = "${var.img_name}"
  flavor_name = "${var.flv_name}"
  key_pair = "${var.key_pair}"
  security_groups = ["${var.sec_grp}"]
  #metadata {
  #    demo = "metadata"
  #}
  network {
      uuid = "${var.internal_network_id}"
      name = "${var.internal_network_name}"
      #fixed_ip = ""
  }
  floating_ip = "${element(openstack_compute_floatingip_v2.jkfip.*.address, count.index)}"
  user_data = "${file("bootstrap-Core.sh")}"
}

resource "template_file" "web_hosts" {
  count = "${var.web_node_count}"
#  location = "${var.placement}"
  template = "${file("hostname.tpl")}"
  vars {
    index = "${count.index + 1}"
    name  = "web"
    env   = "qual"
    extra = " ansible_host=${element(openstack_compute_floatingip_v2.jkfip.*.address, count.index)}"
  }
}

