#!/bin/bash

sudo yum -y update
sudo yum -y install yum-utils
sudo yum -y groupinstall development
sudo yum -y install https://centos7.iuscommunity.org/ius-release.rpm

# Install Git and clone project
sudo yum -y install wget vim git
cd ~
git clone https://github.com/franciscogd/self-service.git

# Install Python 3.6 and pip
sudo yum -y install python36u
sudo yum -y install python36u-pip

# Install Python required packages
pip3.6 install -y mysql-connector
pip3.6 install -y docker

# Install Docker CE
sudo yum install -y device-mapper-persistent-data lvm2
sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo

sudo yum install docker-ce -y

# Pull Docker base containers
docker pull ubuntu:14.04
docker pull ubuntu:16.04
docker pull ubuntu:17.10
docker pull ubuntu:18.04
docker pull centos6.6
docker pull centos6.7
docker pull centos6.8
docker pull centos6.9
docker pull centos7.0.1406
docker pull centos7.1.1503
docker pull centos7.2.1511
docker pull centos7.3.1611
docker pull centos7.4.1708
