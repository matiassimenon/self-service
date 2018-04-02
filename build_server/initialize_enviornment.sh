#!/bin/bash

sudo yum -y update
sudo yum -y install yum-utils
sudo yum -y groupinstall development
sudo yum -y install https://centos7.iuscommunity.org/ius-release.rpm
sudo yum -y install wget vim git

# Install Python 3.6 and pip
sudo yum -y install python36u
sudo yum -y install python36u-pip

# Install Python required packages
sudo pip3.6 install mysql-connector
sudo pip3.6 install docker
sudo pip3.6 install --upgrade pip

# Install Docker CE
sudo yum install -y device-mapper-persistent-data lvm2
sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo

sudo yum install docker-ce -y

# Start Docker
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker $(whoami)

# Pull Docker base containers
sudo docker pull ubuntu:14.04
sudo docker pull ubuntu:16.04
sudo docker pull ubuntu:17.10
sudo docker pull ubuntu:18.04
sudo docker pull ubuntu:latest
sudo docker pull centos:6.6
sudo docker pull centos:6.7
sudo docker pull centos:6.8
sudo docker pull centos:6.9
sudo docker pull centos:7.0.1406
sudo docker pull centos:7.1.1503
sudo docker pull centos:7.2.1511
sudo docker pull centos:7.3.1611
sudo docker pull centos:7.4.1708
sudo docker pull centos:latest
