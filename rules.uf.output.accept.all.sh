#!/bin/bash

ACTION=$1
source $(dirname $0)/uf.config.sh
source $(dirname $0)/uf.config.interfaces.sh
echo -e "$ACT $(basename $0)"


$iptables $ACTION_OUTPUT -o $out_int  -j LOG-FIL-OUT-ACCEPT



$ip6tables $ACTION_OUTPUT -o $out_int  -j LOG-FIL-OUT-ACCEPT




