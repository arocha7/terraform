resource "template_file" "inventory" {
  template = "${file("inventory.tpl")}"
  vars {
    env = "${var.env}"
    fe_hosts = "${join("\n",template_file.fe_hosts.*.rendered)}"
    be_hosts = "${join("\n",template_file.be_hosts.*.rendered)}"
  }
}

output "inventory" {
  value = "${template_file.inventory.rendered}"
}

