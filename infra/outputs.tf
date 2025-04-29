output "ipv4_address" {
  description = "The IPv4 address of the server"
  value       = hcloud_server.server.ipv4_address
  depends_on  = [hcloud_server.server]
}

output "ipv6_address" {
  description = "The IPv6 address of the server"
  value       = hcloud_server.server.ipv6_address
  depends_on  = [hcloud_server.server]
}

output userdata {
  value = "\n${data.template_file.user_data.rendered}"
}
