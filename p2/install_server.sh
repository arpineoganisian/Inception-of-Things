#!/bin/bash

echo "127.0.0.1 $(hostname)" >> /etc/hosts

#cat /home/vagrant/.ssh/id_rsa.pub  >> /home/vagrant/.ssh/authorized_keys
#sudo mkdir /root/.ssh
#cp -R  /home/vagrant/.ssh/*  /root/.ssh

sudo yum install -y net-tools

export INSTALL_K3S_VERSION=v1.23.6+k3s1
export K3S_KUBECONFIG_MODE="644"
export INSTALL_K3S_EXEC="server --node-ip 192.168.42.110"

curl -sfL https://get.k3s.io | sh -

/usr/local/bin/kubectl create configmap app-one-html --from-file /home/vagrant/app1/index.html
/usr/local/bin/kubectl create configmap app-two-html --from-file /home/vagrant/app2/index.html
/usr/local/bin/kubectl create configmap app-three-html --from-file /home/vagrant/app3/index.html

/usr/local/bin/kubectl apply -f /home/vagrant/deployment.yaml
