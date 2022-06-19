#!/bin/bash

sudo apt update -y
sudo apt upgrade -y

# intall docker
sudo apt install curl -y
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh ./get-docker.sh
sudo usermod -aG docker $USER
sudo chmod 666 /var/run/docker.sock

# install kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
#curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl

#install K3d
curl -s https://raw.githubusercontent.com/rancher/k3d/main/install.sh | bash
