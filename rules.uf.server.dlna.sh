#!/bin/bash

ACTION=$1
source $(dirname $0)/uf.config.sh
source $(dirname $0)/uf.config.interfaces.sh


$iptables $ACTION_INPUT -i $LAN -p udp -m udp --dport 1900 -j LOG-FIL-OUT-ACCEPT
$iptables $ACTION_INPUT -i $LAN -p tcp -m tcp --dport 8200 -j LOG-FIL-OUT-ACCEPT

$iptables $ACTION_OUTPUT -o $LAN -p udp -m udp --sport 1900 -j LOG-FIL-IN-ACCEPT










