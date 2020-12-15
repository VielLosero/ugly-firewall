#!/bin/bash

ACTION=$1
source $(dirname $0)/uf.config.sh
source $(dirname $0)/uf.config.interfaces.sh

#$iptables -t nat -N LOG-NAT-POST-MASQUERADE
#$iptables -t nat -A POSTROUTING -s 192.168.2.0/24 -o $out_int -j LOG-NAT-POST-MASQUERADE
#$iptables -t nat -A LOG-NAT-POST-MASQUERADE -j MASQUERADE
#
#$iptables $ACTION_FORWARD -s 192.168.2.0/24 -j LOG-FIL-FORWARD-ACCEPT
#$iptables -I FORWARD 2 -m state --state RELATED,ESTABLISHED -j LOG-FIL-FORWARD-ACCEPT

iptables -t nat -N LOG-NAT-POST-MASQUERADE
iptables -t nat $ACTION_POSTROUTING -s 192.168.168.0/24 -o $out_int -j LOG-NAT-POST-MASQUERADE
iptables -t nat -A LOG-NAT-POST-MASQUERADE -j MASQUERADE

iptables $ACTION_FORWARD -s 192.168.168.0/24 -i $LAN -o $out_int -j LOG-FIL-FORWARD-ACCEPT
iptables -I FORWARD 2 -m state --state RELATED,ESTABLISHED -j LOG-FIL-FORWARD-ACCEPT

#$iptables -t nat -A POSTROUTING  -s 192.168.168.0/24 -o wwan0 -j MASQUERADE
#$iptables -A FORWARD -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
#$iptables -A FORWARD -i wlan0 -o wwan0 -j ACCEPT

#iptables -t nat -A POSTROUTING  -s 192.168.168.0/24 -o eth0 -j MASQUERADE
#iptables -A FORWARD -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
#iptables -A FORWARD -i wlan0 -o eth0 -j ACCEPT

