variable "hcloud_token" {
    description = "The API key for the Hetzner Cloud project"
    type = string
}

variable "username" {
    description = "Name of the user to be created"
    type = string
    default  = ""
}

variable "ssh_public_key" {
    description = "Public SSH key to be used to access the server"
    type = string
    default = ""
}

variable "server_type" {
    description = "A type of the server to be created"
    type = string
    default = "cx22"
}

variable "image" {
    description = "Image to be used for creation of the server"
    type = string
    default = "ubuntu-22.04"
}

variable "location" {
    description = "Geographical location for the servers"
    type = string
    default = "hel1"
}