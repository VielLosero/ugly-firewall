#!/bin/bash

ACTION=$1
source $(dirname $0)/uf.config.sh
source $(dirname $0)/uf.config.interfaces.sh
echo -e "$ACT $(basename $0)"

iptables $ACTION_OUTPUT -p tcp --dport 5900 -m state --state NEW,ESTABLISHED -j LOG-FIL-OUT-ACCEPT
