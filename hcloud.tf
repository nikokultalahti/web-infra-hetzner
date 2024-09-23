# Configure the Hetzner Cloud Provider
provider "hcloud" {
  token   = var.hcloud_token
}

# Create a server
resource "hcloud_server" "web" {
  name        = "cloud-server"
  server_type = "cx22"
  image       = var.os_type
  location    = var.location
}