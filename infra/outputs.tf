output "ipv4_address" {
  description = "The IPv4 address of the server"
  value       = hcloud_server.coolify.ipv4_address
  depends_on  = [hcloud_server.coolify]
}

output "ipv6_address" {
  description = "The IPv6 address of the server"
  value       = hcloud_server.coolify.ipv6_address
  depends_on  = [hcloud_server.coolify]
}

output userdata {
  value = "\n${data.template_file.user_data.rendered}"
}
