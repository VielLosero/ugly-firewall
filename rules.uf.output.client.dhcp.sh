#!/bin/bash

ACTION=$1
source $(dirname $0)/uf.config.sh
source $(dirname $0)/uf.config.interfaces.sh

#$iptables $ACTION_OUTPUT -p udp -m udp --sport 68 --dport 67 -m owner --uid-owner dhcpcd  -j LOG-FIL-OUT-ACCEPT
$iptables $ACTION_OUTPUT -p udp -m udp --sport 68 --dport 67 -j LOG-FIL-OUT-ACCEPT


#$ip6tables $ACTION_OUTPUT -p udp -m udp --sport 546 -j LOG-FIL-OUT-ACCEPT










