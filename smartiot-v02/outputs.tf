resource "template_file" "smartiot_inventory" {
  template = "${file("inventory.tpl")}"
  vars {
    env = "qual"
    historydb_host = "${join("\n",template_file.historydb_hosts.*.rendered)}"
    catalogdb_host = "${join("\n",template_file.catalogdb_hosts.*.rendered)}"
    inputqueue_host = "${join("\n",template_file.inputqueue_hosts.*.rendered)}"
    deliveryqueue_host = "${join("\n",template_file.deliveryqueue_hosts.*.rendered)}"
    listener_host = "${join("\n",template_file.listener_hosts.*.rendered)}"
    processingworker_host = "${join("\n",template_file.processingworker_hosts.*.rendered)}"
    deliveryworker_host = "${join("\n",template_file.deliveryworker_hosts.*.rendered)}"
    retrydeliveryworker_host = "${join("\n",template_file.retrydeliveryworker_hosts.*.rendered)}"
    configserver_host = "${join("\n",template_file.configserver_hosts.*.rendered)}"
    logs_host = "${join("\n",template_file.logs_hosts.*.rendered)}"
  }
}

output "smartiot_inventory" {
  value = "${template_file.smartiot_inventory.rendered}"
}
