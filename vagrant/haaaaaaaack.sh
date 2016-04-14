#!/bin/bash

# forward  traffic from the crappy,
# default vagrant dhcp-ized iface to the real one from vmware

destip=$1
port=$2
shittyip=$(ip addr | grep 'eth0' |grep 'state UP' -A2 | tail -n1 | awk '{print $2}' | cut -f1  -d'/')
sudo iptables -t nat -A PREROUTING -p tcp -d ${shittyip} --dport ${port} -j DNAT --to ${destip}:${port}
sudo iptables-save
# ^^ this doesnt appear to work, dont know why, so droppping into into init
if [[ -f /etc/rc3.d/S99haaaaaaack ]]; then
    exit 0
fi
cat << EOF > /etc/init.d/haaaaaaack.sh
#!/bin/bash
sudo iptables -t nat -A PREROUTING -p tcp -d ${shittyip} --dport ${port} -j DNAT --to ${destip}:${port}
EOF
chmod +x /etc/init.d/haaaaaaack.sh
ln -s /etc/init.d/haaaaaaack.sh /etc/rc3.d/S99haaaaaaack

