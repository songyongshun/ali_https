#!/bin/bash

# first time
#iptables -A INPUT -p tcp --dport 80 -j DROP
#iptables -A INPUT -p tcp --dport 443 -j DROP

# check iptable
#iptables -L INPUT -n --line-number

# add ip 
iptables -D INPUT 2
iptables -A INPUT -p tcp --dport 443 -s 49.94.166.0/24 -j ACCEPT
iptables -A INPUT -p tcp --dport 443 -j DROP
