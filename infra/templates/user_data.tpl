#cloud-config

# Create a non-root user with sudo privileges for secure server access
users:
  - name: ${username}
    groups: sudo,docker
    sudo: ALL=(ALL) NOPASSWD:ALL
    shell: /bin/bash
    ssh_authorized_keys:
      - ${ssh_public_key}

# Enable automatic package updates and upgrades during cloud-init execution
package_update: true
package_upgrade: true
package_reboot_if_required: true

# Install packages
packages:
  - fail2ban
  - cockpit
  - podman
  - podman-compose
  - podman-docker

runcmd:
  # Enable SSH jail for fail2ban
  - printf "[sshd]\nenabled = true\nbanaction = iptables-multiport" > /etc/fail2ban/jail.local

  # Harden SSH configuration
  - sed -i -e "/^\(#\|\)Port/s/^.*$/Port 1111/" /etc/ssh/sshd_config 
  - sed -i -e "/^\(#\|\)PermitRootLogin/s/^.*$/PermitRootLogin no/" /etc/ssh/sshd_config 
  - sed -i -e "/^\(#\|\)PasswordAuthentication/s/^.*$/PasswordAuthentication no/" /etc/ssh/sshd_config
  - sed -i -e "/^\(#\|\)MaxAuthTries/s/^.*$/MaxAuthTries 3/" /etc/ssh/sshd_config
  - sed -i -e "/^\(#\|\)X11Forwarding/s/^.*$/X11Forwarding no/" /etc/ssh/sshd_config
  - sed -i -e "/^\(#\|\)AllowTcpForwarding/s/^.*$/AllowTcpForwarding no/" /etc/ssh/sshd_config
  - sed -i -e "/^\(#\|\)AllowAgentForwarding/s/^.*$/AllowAgentForwarding no/" /etc/ssh/sshd_config
  - sed -i -e "/^\(#\|\)AuthorizedKeysFile/s/^.*$/AuthorizedKeysFile .ssh\/authorized_keys/" /etc/ssh/sshd_config

  # Set up Podman to run as non-root user
  - sudo usermod --add-subuids 100000-165535 --add-subgids 100000-165535 ${username}

  # Install Docker-Compose
  - curl -SL https://github.com/docker/compose/releases/download/v2.35.1/docker-compose-linux-$(uname -m) -o /usr/local/bin/docker-compose
  - sudo chmod +x /usr/local/bin/docker-compose

  # Install Caddy
  - sudo apt install -y debian-keyring debian-archive-keyring apt-transport-https curl
  - curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/gpg.key' | sudo gpg --dearmor -o /usr/share/keyrings/caddy-stable-archive-keyring.gpg
  - curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/debian.deb.txt' | sudo tee /etc/apt/sources.list.d/caddy-stable.list
  - sudo apt update
  - sudo apt install caddy

  # Enable, restart and clean up
  - systemctl enable fail2ban 
  - systemctl restart fail2ban
  - systemctl reload ssh
  - systemctl enable --now caddy
  - sudo systemctl reload caddy
  - apt-get autoremove -y
  - apt-get clean