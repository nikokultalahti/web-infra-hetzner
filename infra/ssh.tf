resource "hcloud_ssh_key" "default" {
  name       = "hetzner_key"
  public_key = var.ssh_public_key
}