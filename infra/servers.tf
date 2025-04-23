# Create a server
resource "hcloud_server" "coolify" {
  name        = "coolify"
  server_type = "${var.server_type}"
  image       = "${var.image}"
  location    = "${var.location}"
  ssh_keys    = [hcloud_ssh_key.default.id]
  user_data   = "${file("./templates/user_data.yaml")}"
  firewall_ids = [hcloud_firewall.firewall_coolify.id]
}