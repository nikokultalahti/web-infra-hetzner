# Create a server
resource "hcloud_server" "server" {
  name        = "${var.server_type}-${var.image}-${var.location}"
  server_type = var.server_type
  image       = var.image
  location    = var.location
  ssh_keys    = [hcloud_ssh_key.default.id]
  user_data   = data.template_file.user_data.rendered
  firewall_ids = [hcloud_firewall.firewall.id]
}