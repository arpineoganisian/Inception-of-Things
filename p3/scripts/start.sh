#!/bin/bash

sudo systemctl start docker

#sudo k3d cluster create p3 --api-port 6443 -p 8080:80@loadbalancer --agents 2 --wait
sudo k3d cluster create p3 -p 8080:80@loadbalancer --wait
# map port 8081 from the host to port 80 on the container which matches the nodefilter loadbalancer“
#the loadbalancer nodefilter matches only the serverlb that’s deployed in front of a cluster’s server nodes
#all ports exposed on the serverlb will be proxied to the same ports on all server nodes in the cluster

# creating namespaces
sudo kubectl create namespace argocd
sudo kubectl create namespace dev

# installing Argo CD
sudo kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

sudo kubectl apply -n argocd -f application.yaml

sudo kubectl get secret argocd-initial-admin-secret -n argocd -o jsonpath={.data.password} | base64 --decode > password

sudo kubectl port-forward svc/argocd-server -n argocd 8082:80
