#!/bin/bash
set -e

# Enable systemd for WSL
echo "🔧 Enabling systemd for WSL..."
sudo bash -c 'echo "[boot]" >> /etc/wsl.conf'
sudo bash -c 'echo "systemd=true" >> /etc/wsl.conf'

# Update packages
echo "🔧 Updating packages..."
sudo apt update && sudo apt upgrade -y

# Install dependencies for Docker
echo "🐳 Installing Docker dependencies..."
sudo apt-get install -y ca-certificates curl gnupg lsb-release

# Set up Docker repository
echo "🐳 Setting up Docker repository..."
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Install Docker
echo "🐳 Installing Docker..."
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose

# Add user to Docker group
echo "👤 Adding user to docker group..."
sudo usermod -aG docker $USER

# Apply group changes
newgrp docker

# Display Docker version
echo "🐳 Docker installed successfully!"
docker --version

# Recommend restarting WSL to finalize group membership changes
echo "🔄 Please restart your WSL terminal for the Docker group changes to take effect."
