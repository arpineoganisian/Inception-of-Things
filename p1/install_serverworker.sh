#!/bin/bash

echo "127.0.0.1 $(hostname)" >> /etc/hosts
echo "192.168.42.110 hwoodwriS" >> /etc/hosts

sudo yum install -y net-tools

# TODO
scp -o StrictHostKeyChecking=no root@192.168.42.110:/var/lib/rancher/k3s/server/node-token /home/vagrant/token

export INSTALL_K3S_VERSION=v1.23.6+k3s1
export K3S_URL=https://192.168.42.110:6443
export K3S_TOKEN_FILE=/home/vagrant/token
export INSTALL_K3S_EXEC="--node-ip 192.168.42.111"

curl -sfL https://get.k3s.io | sh -
