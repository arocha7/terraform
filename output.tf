output "list-of-ipaddrs" {
  value = "${join(",", openstack_compute_instance_v2.smartiot.*.access_ip_v4)}"
}

output "list-of-nodes" {
        value = "${template_file.etc_ansible_hosts.rendered}"
}
