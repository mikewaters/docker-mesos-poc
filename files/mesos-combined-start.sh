#!/bin/bash

# oh where art though, puppet?
sudo service zookeeper start || sudo service zookeeper restart
sudo service mesos-master start || sudo service mesos-master restart
sudo service mesos-slave start || sudo service mesos-slave restart
sudo service marathon start || sudo service marathon restart
