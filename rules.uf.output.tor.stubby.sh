#!/bin/bash

ACTION=$1
source $(dirname $0)/uf.config.sh
source $(dirname $0)/uf.config.interfaces.sh
echo -e "$ACT $(basename $0)"

$iptables $ACTION_OUTPUT -o $out_int -m owner --uid-owner $tor -j LOG-FIL-OUT-ACCEPT
$iptables $ACTION_OUTPUT -o $out_int -p tcp -m tcp --dport 853 -j LOG-FIL-OUT-ACCEPT
#$iptables $ACTION_OUTPUT -o $out_int -m owner --uid-owner "stubby" -j LOG-FIL-OUT-ACCEPT


$ip6tables $ACTION_OUTPUT -o $out_int -m owner --uid-owner $tor -j LOG-FIL-OUT-ACCEPT
$ip6tables $ACTION_OUTPUT -o $out_int -p tcp -m tcp --dport 853 -j LOG-FIL-OUT-ACCEPT
#$ip6tables $ACTION_OUTPUT -o $out_int -m owner --uid-owner "stubby" -j LOG-FIL-OUT-ACCEPT




