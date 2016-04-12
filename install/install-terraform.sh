#!/bin/bash

# install terraform 0.6.14
sudo apt-get -y install unzip
(cd /tmp && wget https://releases.hashicorp.com/terraform/0.6.14/terraform_0.6.14_linux_amd64.zip)
sudo unzip /tmp/terraform_0.6.14_linux_amd64.zip -d /opt/terraform
sudo cp etc/profile.d/terraform.sh /etc/profile.d/
source /etc/profile.d/terraform.sh


# verify
terraform
