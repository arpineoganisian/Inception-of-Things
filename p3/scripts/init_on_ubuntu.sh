#!/bin/bash

echo "UPDATING"
sudo apt update -y
sudo apt upgrade -y

#sudo apt install openssh-server
#sudo apt install net-tools

echo "INSTALLING DOCKER"
# intall docker
sudo apt install curl -y
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh ./get-docker.sh
sudo usermod -aG docker $USER
sudo chmod 666 /var/run/docker.sock

echo "INSTALLING KUBECTL"
# install kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl

echo "ISTALLING K3D"
#install K3d
curl -s https://raw.githubusercontent.com/rancher/k3d/main/install.sh | bash
