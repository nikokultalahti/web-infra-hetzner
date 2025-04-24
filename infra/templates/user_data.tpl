#cloud-config

# Create a non-root user with sudo privileges for secure server access
users:
  - name: ${username}
    groups: sudo
    sudo: ALL=(ALL) NOPASSWD:ALL
    shell: /bin/bash
    ssh_authorized_keys:
      - ${ssh_public_key}

# Enable automatic package updates and upgrades during cloud-init execution
package_update: true
package_upgrade: true

# Install packages
packages:
  - fail2ban
  - cockpit
       
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
  # Enable, restart and clean up
  - systemctl enable fail2ban 
  - systemctl restart fail2ban
  - systemctl reload ssh
  - apt-get autoremove -y
  - apt-get clean
  - reboot