#!/bin/bash

ACTION=$1
source $(dirname $0)/uf.config.sh
source $(dirname $0)/uf.config.interfaces.sh


$iptables $ACTION_OUTPUT -p icmp -j LOG-FIL-OUT-ACCEPT


$ip6tables $ACTION_OUTPUT -p icmp -j LOG-FIL-OUT-ACCEPT








