### BACKEND

variable "be_node_count" {
  default = 2
}

# Create the database servers
resource "openstack_compute_instance_v2" "backend" {
  count           = "${var.be_node_count}"
  name            = "be-${var.vm_name}${format("%02d",count.index)}"
  region          = ""
  image_id        = "${var.os_img_id}"
  flavor_id       = "${var.os_flv_id}"
  key_pair        = "${var.os_key_pair}"
  security_groups = ["${var.os_sec_grp}"]
  network {
      uuid = "${var.internal_network_id}"
      name = "${var.internal_network_name}"
      #fixed_ip = ""
  }
  floating_ip = "${element(openstack_compute_floatingip_v2.be_fip.*.address, count.index)}"
  user_data = "${file("bootstrap-be-pgsql-${var.distro}.sh")}"
}

# Assign a Floating IP
resource "openstack_compute_floatingip_v2" "be_fip" {
  region = ""
  pool   = "${var.os_fip_pool}"
  count  = "${var.be_node_count}"
}

### Create an entry in 'hosts' file for Ansible inventory

resource "template_file" "be_hosts" {
  count = "${var.be_node_count}"
  template = "${file("hostname.tpl")}"
  vars {
    index = "${count.index + 1}"
    name  = "be"
    env   = "${var.env}"
    extra = " ansible_host=${element(openstack_compute_floatingip_v2.be_fip.*.address, count.index)}"
  }
}

