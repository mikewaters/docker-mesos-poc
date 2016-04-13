# Instructions for cluster vagrant variant

Will create two nodes, one master and one slave.
Requires static IP so each node knows about the other.  This is easily accomplished with terraform, not so much with vagrant.

## Notes
`./haaaaaaaack.sh` redirects requests to the dhcp interface to the static interface, so you can access services
running on the static interface outside the vm via the forwarded ports.

## TODO
`vagrant plugin install landrush`
