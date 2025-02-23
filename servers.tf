# Create a server
resource "hcloud_server" "server" {
  name        = "server"
  server_type = "cx22"
  image       = "ubuntu-22.04"
  location    = "hel1"
  ssh_keys    = [hcloud_ssh_key.default.id]
  user_data   = "${file("user_data.yaml")}"
}