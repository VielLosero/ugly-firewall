#!/bin/bash

ACTION=$1
source $(dirname $0)/uf.config.sh
source $(dirname $0)/uf.config.interfaces.sh

$iptables $ACTION_OUTPUT -o $WAN -p udp -m udp --dport 80 -j LOG-FIL-OUT-ACCEPT
$iptables $ACTION_OUTPUT -o $WAN -p udp -m udp --dport 443 -j LOG-FIL-OUT-ACCEPT
$iptables $ACTION_OUTPUT -o $WAN -p udp -m udp --dport 4569 -j LOG-FIL-OUT-ACCEPT
$iptables $ACTION_OUTPUT -o $WAN -p udp -m udp --dport 1194 -j LOG-FIL-OUT-ACCEPT
$iptables $ACTION_OUTPUT -o $WAN -p udp -m udp --dport 5060 -j LOG-FIL-OUT-ACCEPT

#$iptables $ACTION_OUTPUT -o $VPN -p udp -m udp --dport 53 -m owner --uid-owner unbound -j LOG-FIL-OUT-ACCEPT
#$iptables $ACTION_OUTPUT -o $VPN -p tcp -m tcp --dport 53 -m owner --uid-owner unbound -j LOG-FIL-OUT-ACCEPT
#$iptables $ACTION_OUTPUT -o $VPN -p tcp -m tcp --dport 80 -j LOG-FIL-OUT-ACCEPT
#$iptables $ACTION_OUTPUT -o $VPN -p tcp -m tcp --dport 443 -j LOG-FIL-OUT-ACCEPT
#$iptables $ACTION_OUTPUT -o $VPN -p tcp -m tcp --dport 853 -j LOG-FIL-OUT-ACCEPT
## mail
#$iptables $ACTION_OUTPUT -o $VPN -p tcp -m tcp --dport 995 -j LOG-FIL-OUT-ACCEPT
#$iptables $ACTION_OUTPUT -o $VPN -p tcp -m tcp --dport 993 -j LOG-FIL-OUT-ACCEPT
#$iptables $ACTION_OUTPUT -o $VPN -p tcp -m tcp --dport 587 -j LOG-FIL-OUT-ACCEPT
#$iptables $ACTION_OUTPUT -o $VPN -p tcp -m tcp --dport 465 -j LOG-FIL-OUT-ACCEPT


$ip6tables $ACTION_OUTPUT -o $WAN -p udp -m udp --dport 80 -j LOG-FIL-OUT-ACCEPT
$ip6tables $ACTION_OUTPUT -o $WAN -p udp -m udp --dport 443 -j LOG-FIL-OUT-ACCEPT
$ip6tables $ACTION_OUTPUT -o $WAN -p udp -m udp --dport 4569 -j LOG-FIL-OUT-ACCEPT
$ip6tables $ACTION_OUTPUT -o $WAN -p udp -m udp --dport 1194 -j LOG-FIL-OUT-ACCEPT
$ip6tables $ACTION_OUTPUT -o $WAN -p udp -m udp --dport 5060 -j LOG-FIL-OUT-ACCEPT

#$ip6tables $ACTION_OUTPUT -o $VPN -p udp -m udp --dport 53 -m owner --uid-owner unbound -j LOG-FIL-OUT-ACCEPT
#$ip6tables $ACTION_OUTPUT -o $VPN -p tcp -m tcp --dport 53 -m owner --uid-owner unbound -j LOG-FIL-OUT-ACCEPT
#$ip6tables $ACTION_OUTPUT -o $VPN -p tcp -m tcp --dport 80 -j LOG-FIL-OUT-ACCEPT
#$ip6tables $ACTION_OUTPUT -o $VPN -p tcp -m tcp --dport 443 -j LOG-FIL-OUT-ACCEPT
#$ip6tables $ACTION_OUTPUT -o $VPN -p tcp -m tcp --dport 853 -j LOG-FIL-OUT-ACCEPT











