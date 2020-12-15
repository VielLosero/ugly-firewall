#!/bin/bash

ACTION=$1
source $(dirname $0)/uf.config.sh
source $(dirname $0)/uf.config.interfaces.sh

$iptables -A INPUT -j LOG-FIL-IN-DROP
$iptables -A FORWARD -j LOG-FIL-FORWARD-DROP
$iptables -A OUTPUT -j LOG-FIL-OUT-DROP


$ip6tables -A INPUT -j LOG-FIL-IN-DROP
$ip6tables -A FORWARD -j LOG-FIL-FORWARD-DROP
$ip6tables -A OUTPUT -j LOG-FIL-OUT-DROP

