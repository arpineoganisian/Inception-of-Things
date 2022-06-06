#!/bin/bash

# CentOS Linux 8 had reached the End Of Life (EOL) on December 31st, 2021.
# It means that CentOS 8 will no longer receive development resources from the official CentOS project.
# After Dec 31st, 2021, if you need to update your CentOS, you need to change the mirrors to vault.centos.org where they will be archived permanently.
cd /etc/yum.repos.d/
sudo sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
sudo sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
sudo yum update -y

cd


# Version of K3s to download from Github. Will attempt to download from the stable channel if not specified
export INSTALL_K3S_VERSION=v1.23.6+k3s1
# K3S_KUBECONFIG_MODE - The option to allow writing to the kubeconfig file is useful for allowing a K3s cluster to be imported into Rancher
export K3S_KUBECONFIG_MODE="644"
# Command with flags to use for launching K3s in the service.
# If the command is not specified, and the K3S_URL is set, it will default to “agent.”
# If K3S_URL not set, it will default to “server.”
export INSTALL_K3S_EXEC="--node-ip 192.168.42.110"

# Installation with Script
curl -sfL https://get.k3s.io | sh -
