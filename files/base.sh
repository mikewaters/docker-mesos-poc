#!/bin/bash

set -e

sudo apt-get install -y wget software-properties-common python-software-properties

# Docker
echo "deb http://get.docker.io/ubuntu docker main" | sudo tee /etc/apt/sources.list.d/docker.list
wget -qO- https://get.docker.io/gpg | sudo apt-key add -

# Mesos
DISTRO=$(lsb_release -is | tr '[:upper:]' '[:lower:]')
CODENAME=$(lsb_release -cs)
echo "deb http://repos.mesosphere.io/${DISTRO} ${CODENAME} main" | sudo tee /etc/apt/sources.list.d/mesosphere.list
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv E56151BF  # ficking firewall

# Packages
sudo apt-get update
#sudo apt-get install -y openjdk-7-jre-headless libcurl3
sudo apt-get install -y lxc-docker
sudo apt-get install -y mesos
sudo service zookeeper stop

