terraform {
  required_providers {
    hcloud = {
      source = "hetznercloud/hcloud"
      version = "~> 1.45"
    }
  }
}

# Configure the Hetzner Cloud Provider
provider "hcloud" {
  token   = "SO5jSgXfuJcZjDAypftNtpJ1JSCFshiI23aGAqAcraxV6A2oZ1AbRwVCks2UWhmQ"
}