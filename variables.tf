terraform {
  required_providers {
    hcloud = {
      source = "hetznercloud/hcloud"
      version = "~> 1.45"
    }
  }
}

variable "hcloud_token" {
  # default = ""
}

variable "location" {
  default = "hel1"
}

variable "os_type" {
  default = "docker-ce"
}