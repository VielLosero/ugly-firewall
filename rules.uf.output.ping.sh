#!/bin/bash

ACTION=$1
source $(dirname $0)/uf.config.sh
source $(dirname $0)/uf.config.interfaces.sh
echo -e "$ACT $(basename $0)"


$iptables $ACTION_OUTPUT -p icmp --icmp-type echo-request -j LOG-FIL-OUT-ACCEPT
$iptables $ACTION_OUTPUT -p icmp --icmp-type echo-reply -j LOG-FIL-OUT-ACCEPT


$ip6tables $ACTION_OUTPUT -p icmp --icmp-type echo-request -j LOG-FIL-OUT-ACCEPT
$ip6tables $ACTION_OUTPUT -p icmp --icmp-type echo-reply -j LOG-FIL-OUT-ACCEPT








