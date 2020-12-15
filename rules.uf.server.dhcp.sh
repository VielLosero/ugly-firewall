#!/bin/bash

ACTION=$1
source $(dirname $0)/uf.config.sh
source $(dirname $0)/uf.config.interfaces.sh

$iptables $ACTION_INPUT -i $LAN -p udp -m udp --sport 68 --dport 67 -j LOG-FIL-IN-ACCEPT
$iptables $ACTION_OUTPUT -o $LAN -p udp -m udp --sport 67 --dport 68 -m owner --uid-owner dhcp -j LOG-FIL-OUT-ACCEPT



#$ip6tables $ACTION_INPUT -o $in_int -p udp -m udp --dport xxx -j LOG-FIL-IN-ACCEPT











