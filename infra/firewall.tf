resource "hcloud_firewall" "firewall_coolify" {
    name   = "firewall_coolify"

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
        port      = "8000"
        source_ips = [
        "0.0.0.0/0",
        "::/0"
        ]
    }

    rule {
        direction = "in"
        protocol  = "tcp"
        port      = "6001-6002"
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