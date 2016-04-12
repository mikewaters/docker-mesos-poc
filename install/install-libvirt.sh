#!/bin/bash

# optional - install terraform libvirt provider
# installs custom terraform provider for libvirt bridged networking

# install golang 1.6
(cd /tmp && wget https://storage.googleapis.com/golang/go1.6.linux-amd64.tar.gz)
sudo tar -C /opt/golang -xvf /tmp/go1.6.linux-amd64.tar.gz
sudo mkdir /opt/golibs
sudo cp etc/profile.d/golang.sh /etc/profile.d/
source /etc/profile.d/golang.sh

# install terraform libvirt plugin for qemu 2.1
# this is our hacked version that only supports bridged networking
sudo git clone https://github.com/mikewaters/terraform-provider-libvirt.git $GOPATH/src/github.com/mikewaters/terraform-provider-libvirt
(cd $GOPATH/src/github.com/mikewaters/terraform-provider-libvirt && go get && go install)
sudo cp etc/terraformrc /etc/terraformrc
