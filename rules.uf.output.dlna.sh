#!/bin/bash

ACTION=$1
source $(dirname $0)/uf.config.sh
source $(dirname $0)/uf.config.interfaces.sh
echo -e "$ACT $(basename $0)"

$iptables $ACTION_INPUT -i $LAN -p udp --sport 1900 -j LOG-FIL-IN-ACCEPT

$iptables $ACTION_OUTPUT -o $LAN -p udp --dport 1900 -j LOG-FIL-OUT-ACCEPT
$iptables $ACTION_OUTPUT -o $LAN -p tcp --dport 8200 -j LOG-FIL-OUT-ACCEPT












