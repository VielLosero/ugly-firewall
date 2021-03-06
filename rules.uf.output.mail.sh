#!/bin/bash

ACTION=$1
source $(dirname $0)/uf.config.sh
source $(dirname $0)/uf.config.interfaces.sh
echo -e "$ACT $(basename $0)"

# https://support.google.com/mail/answer/7126229?hl=en

$iptables $ACTION_OUTPUT -o $out_int -p tcp --dport 995 -j LOG-FIL-OUT-ACCEPT
$iptables $ACTION_OUTPUT -o $out_int -p tcp --dport 993 -j LOG-FIL-OUT-ACCEPT
$iptables $ACTION_OUTPUT -o $out_int -p tcp --dport 587 -j LOG-FIL-OUT-ACCEPT
$iptables $ACTION_OUTPUT -o $out_int -p tcp --dport 465 -j LOG-FIL-OUT-ACCEPT



$ip6tables $ACTION_OUTPUT -o $out_int -p tcp --dport 995 -j LOG-FIL-OUT-ACCEPT
$ip6tables $ACTION_OUTPUT -o $out_int -p tcp --dport 993 -j LOG-FIL-OUT-ACCEPT
$ip6tables $ACTION_OUTPUT -o $out_int -p tcp --dport 587 -j LOG-FIL-OUT-ACCEPT
$ip6tables $ACTION_OUTPUT -o $out_int -p tcp --dport 465 -j LOG-FIL-OUT-ACCEPT




