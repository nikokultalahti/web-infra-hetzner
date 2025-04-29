resource "hcloud_firewall" "firewall" {
    name   = "firewall"

    rule {
        direction = "in"
        protocol  = "tcp"
        port = "1111"
        source_ips = [
        "0.0.0.0/0",
        "::/0"
        ]
    }

    rule {
        direction = "in"
        protocol  = "tcp"
        port      = "80"
        source_ips = [
        "0.0.0.0/0",
        "::/0"
        ]
    }

    rule {
        direction = "in"
        protocol  = "tcp"
        port      = "443"
        source_ips = [
        "0.0.0.0/0",
        "::/0"
        ]
    }

}