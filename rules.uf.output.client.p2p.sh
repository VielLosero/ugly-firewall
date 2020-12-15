#!/bin/bash

ACTION=$1
source $(dirname $0)/uf.config.sh
source $(dirname $0)/uf.config.interfaces.sh

$iptables $ACTION_INPUT -i tun0 -p udp --dport 15939 -j LOG-FIL-IN-ACCEPT


#$iptables $ACTION_OUTPUT -o $out_int -m owner --uid-owner transmission -j LOG-FIL-OUT-ACCEPT
$iptables $ACTION_OUTPUT -o $out_int -j LOG-FIL-OUT-ACCEPT



#$ip6tables $ACTION_OUTPUT -o $out_int -m owner --uid-owner transmission -j LOG-FIL-OUT-ACCEPT
$ip6tables $ACTION_OUTPUT -o $out_int -j LOG-FIL-OUT-ACCEPT




