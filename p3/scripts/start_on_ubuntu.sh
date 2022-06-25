#!/bin/bash

sudo systemctl start docker

echo "STARTING CLUSTER"
sudo k3d cluster create p3 -p "8080:80@loadbalancer" -p "8888:8888@loadbalancer" --wait
# map port 8081 from the host to port 80 on the container which matches the nodefilter loadbalancer“
#the loadbalancer nodefilter matches only the serverlb that’s deployed in front of a cluster’s server nodes
#all ports exposed on the serverlb will be proxied to the same ports on all server nodes in the cluster

echo "CREATING NAMESPACES"
sudo kubectl create namespace argocd
sudo kubectl create namespace dev

echo "INSTALLING ARGO CD"
sudo kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

echo "CONFIGURING ARGO CD AND INGRESS"
sleep 30s
sudo kubectl wait --for=condition=Ready pods --all -n argocd
sudo kubectl -n argocd patch svc/argocd-server -p '{"spec": {"type": "LoadBalancer"}}'
sudo kubectl apply -n argocd -f confs/application.yaml
sudo kubectl apply -n argocd -f confs/ingress.yaml
sudo kubectl wait --for=condition=Ready pods --all -n argocd

echo "STARTING ARGO CD UI"
sudo kubectl get secret argocd-initial-admin-secret -n argocd -o jsonpath={.data.password} | base64 --decode > password
cat password
sudo kubectl port-forward svc/argocd-server -n argocd 8082:80

# ssh arpine@localhost -p 2222
# scp -P 2222 * arpine@localhost:/home/arpine
# sudo k3d cluster delete p3
# sudo kubectl get pods -n argocd