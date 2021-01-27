#!/bin/bash

ACTION=$1
source $(dirname $0)/uf.config.sh
source $(dirname $0)/uf.config.interfaces.sh
echo -e "$ACT $(basename $0)"

$iptables $ACTION_INPUT -i $LAN -p tcp --dport 53 -j LOG-FIL-IN-ACCEPT
$iptables $ACTION_INPUT -i $LAN -p udp --dport 53 -j LOG-FIL-IN-ACCEPT
#$iptables $ACTION_OUTPUT -o $LAN -p tcp -m tcp --sport 53 -j LOG-FIL-OUT-ACCEPT
$iptables $ACTION_OUTPUT -o $LAN -p tcp --sport 53 -m state --state NEW,ESTABLISHED -j LOG-FIL-OUT-ACCEPT
$iptables $ACTION_OUTPUT -o $LAN -p udp --sport 53 -m state --state NEW,ESTABLISHED -j LOG-FIL-OUT-ACCEPT
