#!/bin/bash

# Install Java 8 from Oracle's PPA
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update -y
# fixking oracle
echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections
echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections
sudo apt-get install -y oracle-java8-installer oracle-java8-set-default

sudo apt-get install -y marathon
echo manual | sudo tee /etc/init/mesos-slave.override
sudo service zookeeper start
sudo service mesos-master start
sudo service marathon start
