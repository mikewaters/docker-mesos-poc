#!/bin/bash

set -e

#ZK_IP=$(cat /tmp/zk_master)
#sudo echo "zk://${ZK_IP}:2181/mesos" | sudo tee /etc/mesos/zk
sudo echo manual | sudo tee /etc/init/mesos-master.override
sudo echo manual | sudo tee /etc/init/zookeeper.override
sudo echo "docker,mesos" | sudo tee /etc/mesos-slave/containerizers
