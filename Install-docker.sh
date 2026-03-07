#!/bin/bash

# ─────────────────────────────────────────
#  Docker Installation Script
#  OS: RHEL 9 (AWS EC2)
#  Run: bash install-docker.sh
# ─────────────────────────────────────────

echo "─────────────────────────────────"
echo "  Starting Docker Installation"
echo "─────────────────────────────────"

# Step 1 — Install dnf plugins
echo "Step 1: Installing dnf-plugins-core..."
sudo dnf -y install dnf-plugins-core

# Step 2 — Add Docker's official repo
echo "Step 2: Adding Docker repository..."
sudo dnf config-manager --add-repo https://download.docker.com/linux/rhel/docker-ce.repo

# Step 3 — Install Docker
echo "Step 3: Installing Docker..."
sudo dnf install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

# Step 4 — Start Docker engine
echo "Step 4: Starting Docker..."
sudo systemctl start docker

# Step 5 — Enable Docker on reboot
echo "Step 5: Enabling Docker on reboot..."
sudo systemctl enable docker

# Step 6 — Create docker group and add user
echo "Step 6: Setting up docker group..."
sudo groupadd docker
sudo usermod -aG docker ec2-user

echo "─────────────────────────────────"
echo "  Docker Installed Successfully!"
echo "─────────────────────────────────"

# Verify
docker --version
sudo systemctl status docker --no-pager