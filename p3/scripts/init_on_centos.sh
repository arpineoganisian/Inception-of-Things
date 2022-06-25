#!/bin/bash

sudo yum update

sudo yum install -y yum-utils vim net-tools
#  openssh-server
sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo

# Install the latest version of Docker Engine, containerd, and Docker Compose
sudo yum install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
# Install K3d
curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash
# Install kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x kubectl
sudo mv kubectl /usr/local/bin

# запускаем докер
sudo service docker start
sudo chmod 666 /var/run/docker.sock
