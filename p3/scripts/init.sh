#!/bin/bash

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
k3d cluster create p3 -p 8080:80@loadbalancer

# создание пространств имен
kubectl create namespace argocd
kubectl create namespace dev

# install Argo CD
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

# ждем, пока все поды будут готовы
kubectl wait --for=condition=Ready pods --all -n argocd


kubectl apply -f ../confs/project.yaml -n argocd

kubectl apply -f ../confs/application.yaml -n argocd

# Argo CD UI
# port-forward tunnels the traffic from a specified port (8080) at your local host machine to the specified port (443) on the specified pod (svc argocd-server)
#kubectl port-forward -n argocd svc/argocd-server 8080:443
#kubectl port-forward svc/argocd-server --address 10.11.1.253 -n argocd 8081:80
