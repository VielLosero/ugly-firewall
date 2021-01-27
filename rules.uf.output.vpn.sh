#!/bin/bash

ACTION=$1
source $(dirname $0)/uf.config.sh
source $(dirname $0)/uf.config.interfaces.sh
echo -e "$ACT $(basename $0)"

$iptables $ACTION_OUTPUT -o $WAN -p udp --dport 80 -m state --state NEW,ESTABLISHED -j LOG-FIL-OUT-ACCEPT
$iptables $ACTION_OUTPUT -o $WAN -p udp --dport 443 -m state --state NEW,ESTABLISHED -j LOG-FIL-OUT-ACCEPT
$iptables $ACTION_OUTPUT -o $WAN -p udp --dport 4569 -m state --state NEW,ESTABLISHED -j LOG-FIL-OUT-ACCEPT
$iptables $ACTION_OUTPUT -o $WAN -p udp --dport 1194 -m state --state NEW,ESTABLISHED -j LOG-FIL-OUT-ACCEPT
$iptables $ACTION_OUTPUT -o $WAN -p udp --dport 5060 -m state --state NEW,ESTABLISHED -j LOG-FIL-OUT-ACCEPT

#$iptables $ACTION_OUTPUT -o $VPN -p udp --dport 53 -m owner --uid-owner unbound -j LOG-FIL-OUT-ACCEPT
#$iptables $ACTION_OUTPUT -o $VPN -p tcp --dport 53 -m owner --uid-owner unbound -j LOG-FIL-OUT-ACCEPT
#$iptables $ACTION_OUTPUT -o $VPN -p tcp --dport 80 -j LOG-FIL-OUT-ACCEPT
#$iptables $ACTION_OUTPUT -o $VPN -p tcp --dport 443 -j LOG-FIL-OUT-ACCEPT
#$iptables $ACTION_OUTPUT -o $VPN -p tcp --dport 853 -j LOG-FIL-OUT-ACCEPT
## mail
#$iptables $ACTION_OUTPUT -o $VPN -p tcp --dport 995 -j LOG-FIL-OUT-ACCEPT
#$iptables $ACTION_OUTPUT -o $VPN -p tcp --dport 993 -j LOG-FIL-OUT-ACCEPT
#$iptables $ACTION_OUTPUT -o $VPN -p tcp --dport 587 -j LOG-FIL-OUT-ACCEPT
#$iptables $ACTION_OUTPUT -o $VPN -p tcp --dport 465 -j LOG-FIL-OUT-ACCEPT


$ip6tables $ACTION_OUTPUT -o $WAN -p udp --dport 80 -m state --state NEW,ESTABLISHED -j LOG-FIL-OUT-ACCEPT
$ip6tables $ACTION_OUTPUT -o $WAN -p udp --dport 443 -m state --state NEW,ESTABLISHED -j LOG-FIL-OUT-ACCEPT
$ip6tables $ACTION_OUTPUT -o $WAN -p udp --dport 4569 -m state --state NEW,ESTABLISHED -j LOG-FIL-OUT-ACCEPT
$ip6tables $ACTION_OUTPUT -o $WAN -p udp --dport 1194 -m state --state NEW,ESTABLISHED -j LOG-FIL-OUT-ACCEPT
$ip6tables $ACTION_OUTPUT -o $WAN -p udp --dport 5060 -m state --state NEW,ESTABLISHED -j LOG-FIL-OUT-ACCEPT

#$ip6tables $ACTION_OUTPUT -o $VPN -p udp --dport 53 -m owner --uid-owner unbound -j LOG-FIL-OUT-ACCEPT
#$ip6tables $ACTION_OUTPUT -o $VPN -p tcp --dport 53 -m owner --uid-owner unbound -j LOG-FIL-OUT-ACCEPT
#$ip6tables $ACTION_OUTPUT -o $VPN -p tcp --dport 80 -j LOG-FIL-OUT-ACCEPT
#$ip6tables $ACTION_OUTPUT -o $VPN -p tcp --dport 443 -j LOG-FIL-OUT-ACCEPT
#$ip6tables $ACTION_OUTPUT -o $VPN -p tcp --dport 853 -j LOG-FIL-OUT-ACCEPT











