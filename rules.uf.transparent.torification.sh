#!/bin/bash

ACTION=$1
source $(dirname $0)/uf.config.sh
source $(dirname $0)/uf.config.interfaces.sh

$iptables -t nat -N LOG-NAT-PRE-RETURN
$iptables -t nat -N LOG-NAT-PRE-REDIR-9040
$iptables -t nat -N LOG-NAT-PRE-REDIR-5353
$iptables -t nat -N LOG-NAT-OUT-RETURN
$iptables -t nat -N LOG-NAT-OUT-REDIR-9040

$iptables -t nat $ACTION_PREROUTING ! -i lo -p tcp -m tcp --tcp-flags FIN,SYN,RST,ACK SYN -j LOG-NAT-PRE-REDIR-9040
$iptables -t nat $ACTION_PREROUTING ! -i lo -p udp -m udp --dport 53 -j LOG-NAT-PRE-REDIR-5353
$iptables -t nat $ACTION_PREROUTING -s 192.168.2.0/24 -j LOG-NAT-PRE-RETURN
$iptables -t nat $ACTION_OUTPUT -p tcp -m tcp --tcp-flags FIN,SYN,RST,ACK SYN -j LOG-NAT-OUT-REDIR-9040
$iptables -t nat $ACTION_OUTPUT -p tcp -m tcp --dport 853 -j LOG-NAT-OUT-RETURN
#$iptables -t nat $ACTION_OUTPUT -m owner --uid-owner "stubby" -j LOG-NAT-OUT-RETURN
$iptables -t nat $ACTION_OUTPUT -m owner --uid-owner $tor -j LOG-NAT-OUT-RETURN
$iptables -t nat $ACTION_OUTPUT -d 192.168.0.0/16 -j LOG-NAT-OUT-RETURN
$iptables -t nat $ACTION_OUTPUT -o lo -j LOG-NAT-OUT-RETURN

$iptables -t nat -A LOG-NAT-PRE-RETURN -j RETURN
$iptables -t nat -A LOG-NAT-OUT-RETURN -j RETURN
$iptables -t nat -A LOG-NAT-PRE-REDIR-5353 ! -i lo -p udp -m udp --dport 53 -j REDIRECT --to-ports 5353
$iptables -t nat -A LOG-NAT-PRE-REDIR-9040 ! -i lo -p tcp -m tcp --tcp-flags FIN,SYN,RST,ACK SYN -j REDIRECT --to-ports 9040
$iptables -t nat -A LOG-NAT-OUT-REDIR-9040 -p tcp -m tcp --tcp-flags FIN,SYN,RST,ACK SYN -j REDIRECT --to-ports 9040


$iptables -t filter $ACTION_OUTPUT -d 127.0.0.0/8 -j LOG-FIL-OUT-ACCEPT
$iptables -t filter $ACTION_OUTPUT -d 192.168.0.0/16 -j LOG-FIL-OUT-ACCEPT

#$ip6tables -t nat $ACTION_PREROUTING ! -i lo -p tcp -m tcp --tcp-flags FIN,SYN,RST,ACK SYN -j REDIRECT --to-ports 9040
#$ip6tables -t nat $ACTION_OUTPUT -m owner --uid-owner "tor" -j RETURN
#$ip6tables -t nat $ACTION_OUTPUT -o lo -j RETURN
#$ip6tables -t nat $ACTION_OUTPUT -p tcp -m tcp --dport 853 -j RETURN
#$ip6tables -t nat $ACTION_OUTPUT -p tcp -m tcp --tcp-flags FIN,SYN,RST,ACK SYN -j REDIRECT --to-ports 9040

#$ip6tables -t filter -A OUTPUT -d ::1/8 -j LOG-ACCEPT-OUTPUT



