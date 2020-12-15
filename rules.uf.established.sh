#!/bin/bash

ACTION=$1
source $(dirname $0)/uf.config.sh
source $(dirname $0)/uf.config.interfaces.sh


$iptables $ACTION_INPUT -m conntrack --ctstate INVALID,NEW -j LOG-FIL-IN-DROP
$iptables $ACTION_INPUT -m conntrack --ctstate RELATED,ESTABLISHED -j LOG-FIL-IN-ACCEPT
#$iptables $ACTION_INPUT -i $in_int -m state --state INVALID,NEW -j LOG-FIL-IN-DROP


$ip6tables $ACTION_INPUT -m conntrack --ctstate INVALID,NEW -j LOG-FIL-IN-DROP
$ip6tables $ACTION_INPUT -m conntrack --ctstate RELATED,ESTABLISHED -j LOG-FIL-IN-ACCEPT
#$ip6tables $ACTION_INPUT -i $in_int -m state --state INVALID,NEW -j LOG-FIL-IN-DROP








