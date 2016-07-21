output "ipaddrs" {
  value = "${join(",", openstack_compute_instance_v2.iot.*.access_ip_v4)}"
}

output "ansible_hosts" {
        value = "${template_file.ansible_hosts.rendered}"
}
