#!/bin/bash

# install on a 14.10 box that doesnt have any of the required deps

# install terraform 0.6.14
(cd /tmp && wget https://releases.hashicorp.com/terraform/0.6.14/terraform_0.6.14_linux_amd64.zip)
unzip /tmp/terraform_0.6.14_linux_amd64.zip -d /opt/terraform
cp etc/profile.d/terraform.sh /etc/profile.d/
source /etc/profile.d/terraform.sh

# install golang 1.6
(cd /tmp && wget https://storage.googleapis.com/golang/go1.6.linux-amd64.tar.gz)
tar -C /opt/golang -xvf /tmp/go1.6.linux-amd64.tar.gz
mkdir /opt/golibs
cp etc/profile.d/golang.sh /etc/profile.d/
source /etc/profile.d/golang.sh

# install terraform libvirt plugin for qemu 2.1
git clone https://github.com/mikewaters/terraform-provider-libvirt.git $GOPATH/src/github.com/mikewaters/terraform-provider-libvirt
(cd $GOPATH/src/github.com/mikewaters/terraform-provider-libvirt && go get && go install)
cp etc/terraformrc /etc/terraformrc

# verify
terraform
