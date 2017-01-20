resource "template_file" "inventory" {
  template = "${file("inventory.tpl")}"
  vars {
    web_host = "${join("\n",template_file.web_hosts.*.rendered)}"
    db_host = "${join("\n",template_file.db_hosts.*.rendered)}"
  }
}

output "inventory" {
  value = "${template_file.inventory.rendered}"
}
