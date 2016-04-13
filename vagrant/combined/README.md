# Instructions for combined master+slave vagrant variant

Will create one node, master plus slave.

## Notes
`./haaaaaaaack.sh` redirects requests to the dhcp interface to the static interface, so you can access services
running on the static interface outside the vm via the forwarded ports.

