#!/bin/bash

ACTION=$1
source $(dirname $0)/uf.config.sh
source $(dirname $0)/uf.config.interfaces.sh

#$iptables $ACTION_OUTPUT -o $out_int -p udp -m udp --dport 53  -j LOG-FIL-OUT-ACCEPT
#$iptables $ACTION_OUTPUT -o $out_int -p tcp -m tcp --dport 53  -j LOG-FIL-OUT-ACCEPT
$iptables $ACTION_OUTPUT -o $out_int -p udp -m udp --dport 53 -m owner --uid-owner unbound -j LOG-FIL-OUT-ACCEPT
$iptables $ACTION_OUTPUT -o $out_int -p tcp -m tcp --dport 53 -m owner --uid-owner unbound -j LOG-FIL-OUT-ACCEPT
#$iptables $ACTION_OUTPUT -o $out_int -p tcp -m tcp --dport 853 -j LOG-FIL-OUT-ACCEPT



#$ip6tables $ACTION_OUTPUT -o $out_int -p udp -m udp --dport 53 -j LOG-FIL-OUT-ACCEPT
#$ip6tables $ACTION_OUTPUT -o $out_int -p tcp -m tcp --dport 53 -j LOG-FIL-OUT-ACCEPT
$ip6tables $ACTION_OUTPUT -o $out_int -p udp -m udp --dport 53 -m owner --uid-owner unbound -j LOG-FIL-OUT-ACCEPT
$ip6tables $ACTION_OUTPUT -o $out_int -p tcp -m tcp --dport 53 -m owner --uid-owner unbound -j LOG-FIL-OUT-ACCEPT
#$ip6tables $ACTION_OUTPUT -o $out_int -p tcp -m tcp --dport 853 -j LOG-FIL-OUT-ACCEPT



