#!/bin/bash

#ДЛЯ УБУНТУ
## update the apt package index
#sudo apt-get update
#
##install docker
#sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
## install k3d
#curl: `#!bash curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash`


#ДЛЯ СЕНТ ОС
#localectl set-locale LANG=en_US.UTF-8

# Before you install Docker Engine for the first time on a new host machine, you need to set up the Docker repository.
# Afterward, you can install and update Docker from the repository.
sudo yum install -y yum-utils
sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo

# Install the latest version of Docker Engine, containerd, and Docker Compose
sudo yum install docker-ce docker-ce-cli containerd.io docker-compose-plugin
# Install K3d
curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash
# Install kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x kubectl
sudo mv kubectl /usr/local/bin

# запускаем докер
sudo service docker start
sudo chmod 666 /var/run/docker.sock

# создаем кластер
k3d cluster create p3

## создание пространств имен
kubectl create namespace argocd
kubectl create namespace dev



