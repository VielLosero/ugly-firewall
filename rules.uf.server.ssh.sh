#!/bin/bash

ACTION=$1
source $(dirname $0)/uf.config.sh
source $(dirname $0)/uf.config.interfaces.sh

$iptables $ACTION_INPUT -i $LAN -p tcp -m tcp --dport 22 -j LOG-FIL-IN-ACCEPT
$iptables $ACTION_OUTPUT -o $LAN -p tcp -m tcp --sport 22 -j LOG-FIL-OUT-ACCEPT
$iptables $ACTION_OUTPUT -o $LAN -m state --state RELATED,ESTABLISHED -j LOG-FIL-OUT-ACCEPT
