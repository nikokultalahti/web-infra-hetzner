resource "hcloud_ssh_key" "default" {
  name       = "hetzner_key"
  public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILeSZOsAbw1s34xZHMb4YXW/hpFcCdf1sGw8JKmV77sT"
}