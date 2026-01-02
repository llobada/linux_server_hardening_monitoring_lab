#!/bin/bash
# secure-linux.sh
# Automated basic Linux server hardening script
# Author: Obad

# 1. Update system
sudo apt update && sudo apt upgrade -y


# 2. SSH hardening
sudo sed -i 's/^PermitRootLogin.*/PermitRootLogin no/' /etc/ssh/sshd_config
sudo sed -i 's/^PasswordAuthentication.*/PasswordAuthentication no/' /etc/ssh/sshd_config
sudo systemctl restart ssh

# 3. Enable firewall
sudo ufw allow OpenSSH
sudo ufw enable

# 4. Install Fail2Ban
sudo apt install fail2ban -y
sudo systemctl enable fail2ban
sudo systemctl start fail2ban

echo "Basic hardening complete! 🚀"
