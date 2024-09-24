# Configure the Hetzner Cloud Provider
provider "hcloud" {
  token   = var.hcloud_token
}

# Create a server
resource "hcloud_server" "server" {
  name        = "server"
  server_type = "cx22"
  image       = var.os_type
  location    = var.location
  ssh_keys    = [hcloud_ssh_key.default.id]
  user_data   = "${file("user_data.yaml")}"
}

# Create a volume
resource "hcloud_volume" "volume" {
  name       = "storage"
  size       = 100
  server_id  = "${hcloud_server.server.id}"
  automount  = true
  format     = "ext4"
}