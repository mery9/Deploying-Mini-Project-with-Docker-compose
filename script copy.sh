#!/bin/bash
# This script installs and runs Docker and Docker Compose on Ubuntu

# Update the package index and install git
sudo apt -y update
sudo apt -y install git

# Check the git version
git --version

# Clone the project repository
git clone https://github.com/mery9/Deploying-Mini-Project-with-Docker-compose.git

# Change to the project directory
cd Deploying-Mini-Project-with-Docker-compose/

# Remove any existing Docker packages
for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do
    sudo apt-get remove "$pkg"
done

# Add Docker's official GPG key
sudo apt-get -y update
sudo apt-get -y install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update the package index and install Docker
sudo apt-get update
sudo apt-get -y install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Install Docker Compose
sudo apt -y install docker-compose

# Build and run the project with Docker Compose
sudo docker-compose build
sudo docker-compose up -d
