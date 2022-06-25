#!/bin/bash

sudo systemctl start docker

sudo /usr/local/bin/k3d cluster create p3 -p "8080:80@loadbalancer" -p "8888:8888@loadbalancer" --wait
# map port 8081 from the host to port 80 on the container which matches the nodefilter loadbalancer“
#the loadbalancer nodefilter matches only the serverlb that’s deployed in front of a cluster’s server nodes
#all ports exposed on the serverlb will be proxied to the same ports on all server nodes in the cluster

# creating namespaces
sudo /usr/local/bin/kubectl create namespace argocd
sudo /usr/local/bin/kubectl create namespace dev

# installing & configuring Argo CD
sudo /usr/local/bin/kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml


# waiting all pods to run
sleep 30s
sudo /usr/local/bin/kubectl wait --for=condition=Ready pods --all -n argocd

# добавляем спецификации для арго сд сервера, чтобы он работал через loadbalancer
sudo /usr/local/bin/kubectl -n argocd patch svc/argocd-server -p '{"spec": {"type": "LoadBalancer"}}'

sudo /usr/local/bin/kubectl apply -n argocd -f application.yaml
sudo /usr/local/bin/kubectl apply -n argocd -f ingress.yaml

# waiting all pods to run
sleep 30s
sudo /usr/local/bin/kubectl wait --for=condition=Ready pods --all -n argocd

sudo /usr/local/bin/kubectl get secret argocd-initial-admin-secret -n argocd -o jsonpath={.data.password} | base64 --decode > password
cat password

sudo /usr/local/bin/kubectl port-forward svc/argocd-server -n argocd 8082:80

#sudo /usr/local/bin/k3d cluster delete p3
#sudo /usr/local/bin/kubectl get pods -n argocd