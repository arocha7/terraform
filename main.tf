
# create 'N' new basic instances
resource "openstack_compute_instance_v2" "iot" {
  count = "${var.node_count}"
  name = "vm-${count.index + 1}"
  image_name = "${var.image}"
  flavor_name = "${var.flavor}"
  key_pair = "${var.keypair}"
  security_groups = [
    "default"
  ]
  network = {
    name = "net-ptin"
  }
}

# 'template_file' to generate hostnames
resource "template_file" "iot_ansible" {
  count = "${var.node_count}"
  template = "${file("hostname.tpl")}"
  vars {
    index = "${count.index + 1}"
    name  = "iot"
    env   = "prd"
    extra = "ansible_host=${element(openstack_compute_instance_v2.iot.*.access_ip_v4, count.index)}"
  }
}

# 'template_file' to generate Inventory file
resource "template_file" "ansible_hosts" {
  template = "${file("ansible_hosts.tpl")}"
  vars {
    env         = "production"
    iot_hosts   = "${join("\n",template_file.iot_ansible.*.rendered)}"
  }
}
