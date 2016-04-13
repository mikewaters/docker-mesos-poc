#!/bin/bash

# create box file

rm mesos.box
vagrant box remove mesos.box
vagrant up
vagrant package --output mesos.box
vagrant box add mesos.box
vagrant halt && vagrant destroy --force
