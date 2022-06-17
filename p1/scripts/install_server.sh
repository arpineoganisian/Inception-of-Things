#!/bin/bash

echo "127.0.0.1 $(hostname)" >> /etc/hosts

# добавление открытого ключа
cat /home/vagrant/.ssh/id_rsa.pub  >> /home/vagrant/.ssh/authorized_keys
sudo mkdir /root/.ssh
cp -R  /home/vagrant/.ssh/*  /root/.ssh

# Installing the net-tools package (i.e. ifconfig) using the yum command
sudo yum install -y net-tools

# Version of K3s to download from Github. Will attempt to download from the stable channel if not specified
export INSTALL_K3S_VERSION=v1.23.6+k3s1
# The option to allow writing to the kubeconfig file is useful for allowing a K3s cluster to be imported into Rancher
export K3S_KUBECONFIG_MODE="644"
# Command with flags to use for launching K3s in the service.
# If the command is not specified, and the K3S_URL is set, it will default to “agent.”
# If K3S_URL not set, it will default to “server.”
export INSTALL_K3S_EXEC="server --node-ip 192.168.42.110"

# Installation with Script
curl -sfL https://get.k3s.io | sh -
