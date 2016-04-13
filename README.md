# Build framework PoC
## Install
Install terraform using 

    install/install-terraform.sh

## Notes
### All nodes
All nodes have docker and mesos installed.

### Master
Master runs both mesos-master, marathon, and zookeeper.
mesos-slave service is disabled on boot

Required for single master:

    /etc/mesos/zk - IP of zookeeper, which is local IP in our case
    /etc/mesos-master/ip - IP of local iface (TODO: is this required for single-iface server?)
    
Required for multi-master:

    /etc/zookeeper/conf/myid
    QUORUM configuration (TODO)

Optional:

    /etc/mesos-master/cluster - cluster friendly name
    /etc/mesos-master/hostname - dont know why master would need this if hostname is correctly set up

### Slave
Slave runs only mesos-slave.
Zookeeper in installed for client libs, but service is disabled on boot.
mesos-master service is disabled on boot.
Marathon is not installed.

Required:

    /etc/mesos/zk - IP of zookeeper, which is master in single master and ??? in multi-master
    /etc/mesos-slave/ip - IP of local iface (TODO: is this required for single-iface server?)
    
Optional:

    /etc/mesos-slave/hostname - dont know why master would need this if hostname is correctly set up

## Dirs
### aws
terraform provisioning via EC2

### files
shared shell scripts etc.
### libvirt
experimental terraform provisioning for libvirt

    install/install-libvirt.sh
### vagrant
vagrant for testing locally
#### vagrant/cluster
vagrantfile having both master and slave vms
#### vagrant/combined
vagrantfile with single vm, master + slave
