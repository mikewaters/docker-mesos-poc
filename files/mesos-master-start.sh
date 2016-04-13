#!/bin/bash
sudo service mesos-slave stop

# oh where art though, puppet?
sudo service zookeeper start || sudo service zookeeper restart
sudo service mesos-master start || sudo service mesos-master restart
sudo service marathon start || sudo service marathon restart
