#!/bin/bash

ACTION=$1
source $(dirname $0)/uf.config.sh
source $(dirname $0)/uf.config.interfaces.sh
echo -e "$ACT $(basename $0)"

$iptables $ACTION_INPUT -i lo -j LOG-FIL-IN-ACCEPT
$iptables $ACTION_INPUT -d 127.0.0.0/8 ! -i lo -j LOG-FIL-IN-DROP

$iptables $ACTION_OUTPUT -d 127.0.0.1/32 -o lo -j LOG-FIL-OUT-ACCEPT


$ip6tables $ACTION_INPUT -i lo -j LOG-FIL-IN-ACCEPT
$ip6tables $ACTION_INPUT -d ::1 ! -i lo -j LOG-FIL-IN-DROP

$ip6tables $ACTION_OUTPUT -d ::1/64 -j LOG-FIL-OUT-ACCEPT

