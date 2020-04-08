#!/bin/sh

echo "*********************************************************************"
echo "***	CONFIGURATION FIREWALL IN THE PORTS FOR MINING EN CENTOS 8	***"
echo "*********************************************************************"

systemctl stop firewalld
systemctl disable firewalld
systemctl status firewalld

yum install iptables-services -y

systemctl enable iptables

mv /etc/sysconfig/iptables /etc/sysconfig/iptables.old

iptables -A INPUT -i lo -j ACCEPT
iptables -A INPUT ! -i lo -d 127.0.0.0/8 -j REJECT
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A OUTPUT -j ACCEPT
# open ssh or change port ssh 
iptables -A INPUT -p tcp -m state --state NEW -m tcp --dport 2609 -j ACCEPT
# open port ethermine.org
iptables -A INPUT -p tcp --dport 5555 -j ACCEPT
iptables -A INPUT -p tcp --dport 4444 -j ACCEPT
iptables -A INPUT -p tcp --dport 3333 -j ACCEPT
iptables -A INPUT -p tcp --dport 3443 -j ACCEPT
# open port 2miners
iptables -A INPUT -p tcp --dport 2020 -j ACCEPT
iptables -A INPUT -p tcp --dport 1010 -j ACCEPT
iptables -A INPUT -p tcp --dport 3030 -j ACCEPT
iptables -A INPUT -p tcp --dport 6464 -j ACCEPT

# open port nicehash
iptables -A INPUT -p tcp --dport 3353 -j ACCEPT

# open port hiveon
iptables -A INPUT -p tcp --dport 24443 -j ACCEPT

# Close all ports
iptables -A INPUT -p icmp -m icmp --icmp-type 8 -j ACCEPT
iptables -A INPUT -j REJECT
iptables -A FORWARD -j REJECT


iptables -L
service iptables save
systemctl start iptables
systemctl status iptables

