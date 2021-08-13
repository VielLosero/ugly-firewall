#!/bin/bash

ACTION=$1
source $(dirname $0)/uf.config.sh
source $(dirname $0)/uf.config.interfaces.sh
echo -e "$ACT $(basename $0)"

# for async ftp open all ports to output whit allow.all, for now, or from 1023 to 65535 and port 20

#$iptables $ACTION_OUTPUT -o $out_int -p tcp -m tcp --dport 20 -m state --state NEW,ESTABLISHED -j LOG-FIL-OUT-ACCEPT
$iptables $ACTION_OUTPUT -o $out_int -p tcp -m tcp --dport 21 -m state --state NEW,ESTABLISHED -j LOG-FIL-OUT-ACCEPT



#$ip6tables $ACTION_OUTPUT -o $out_int -p tcp -m tcp --dport 20 -m state --state NEW,ESTABLISHED -j LOG-FIL-OUT-ACCEPT
$ip6tables $ACTION_OUTPUT -o $out_int -p tcp -m tcp --dport 21 -m state --state NEW,ESTABLISHED -j LOG-FIL-OUT-ACCEPT




