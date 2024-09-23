terraform {
  required_providers {
    hcloud = {
      source = "hetznercloud/hcloud"
      version = "~> 1.45"
    }
  }
}

variable "hcloud_token" {
  sensitive = true
  default = "IcNZpEkrxS0vFZ13QwZ1WhkKTbvfoHKIArepfmMMoadXNIf0wwdEHs0pbX7m6Oop"
}

variable "location" {
  default = "hel1"
}

variable "os_type" {
  default = "docker-ce"
}