#!/bin/bash

#installing tools
sudo apt update
sudo apt install -y apt-utils
sudo apt install -y curl
sudo apt install -y wget
sudo apt install -y git
sudo apt install vim -y

#docker installation
sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
apt-cache policy docker-ce
sudo apt install docker-ce -y

#kubectl install
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

#k3d install
curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash

# download manifest file deployment.yaml from GitHub to create my kubernetes cluster
curl -LJO /home/vagrant/ https://github.com/italoleitecg/technical-challenge-local/raw/main/deployment.yaml -o /home/vagrant/deployment.yaml

# create cluster with port binding to port 80.
sudo k3d cluster create grafanacluster -p "80:30000@loadbalancer"

# run deployment manifest
sudo kubectl apply -f /home/vagrant/deployment.yaml