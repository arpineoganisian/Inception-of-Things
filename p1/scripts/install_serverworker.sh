#!/bin/bash

echo "127.0.0.1 $(hostname)" >> /etc/hosts
echo "192.168.42.110 hwoodwriS" >> /etc/hosts

cat /home/vagrant/.ssh/id_rsa.pub  >> /home/vagrant/.ssh/authorized_keys
sudo mkdir /root/.ssh
cp -R  /home/vagrant/.ssh/*  /root/.ssh

sudo yum install -y net-tools

# copy token from the master node (server) to be able to add worked nodes (agent) to it
sudo scp -o StrictHostKeyChecking=no root@192.168.42.110:/var/lib/rancher/k3s/server/node-token /home/vagrant/token

export INSTALL_K3S_VERSION=v1.23.6+k3s1
export K3S_URL=https://192.168.42.110:6443
export K3S_TOKEN_FILE=/home/vagrant/token
export INSTALL_K3S_EXEC="agent --node-ip 192.168.42.111"

curl -sfL https://get.k3s.io | sh -
