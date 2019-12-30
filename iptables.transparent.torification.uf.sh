#!/bin/bash

source $(dirname $0)/uf.config.sh

$iptables -t nat -N LOG-OUTPUT-RETURN
$iptables -t nat -N LOG-PREROUTING-RETURN
$iptables -t nat -N LOG-PREROUTING-REDIRECT-9040
$iptables -t nat -N LOG-OUTPUT-REDIRECT-9040

#$iptables -t nat -I PREROUTING ! -i lo -p udp -m udp --dport 53 -j REDIRECT --to-ports 5353
$iptables -t nat -I PREROUTING 1 -s 192.168.2.0/24 -j LOG-PREROUTING-RETURN
$iptables -t nat -I PREROUTING 2 ! -i lo -j LOG-PREROUTING-REDIRECT-9040
$iptables -t nat -I OUTPUT 1 -o lo -j LOG-OUTPUT-RETURN
$iptables -t nat -I OUTPUT 2 -d 192.168.0.0/16 -j LOG-OUTPUT-RETURN
$iptables -t nat -I OUTPUT 3 -m owner --uid-owner $tor -j LOG-OUTPUT-RETURN
#$iptables -t nat -I OUTPUT 4 -m owner --uid-owner "stubby" -j LOG-OUTPUT-RETURN
$iptables -t nat -I OUTPUT 4 -p tcp -m tcp --dport 853 -j LOG-OUTPUT-RETURN
$iptables -t nat -I OUTPUT 5 -j LOG-OUTPUT-REDIRECT-9040

$iptables -t nat -A LOG-PREROUTING-RETURN -j RETURN
$iptables -t nat -A LOG-OUTPUT-RETURN -j RETURN
$iptables -t nat -A LOG-PREROUTING-REDIRECT-9040 -p tcp -m tcp --tcp-flags FIN,SYN,RST,ACK SYN -j REDIRECT --to-ports 9040
$iptables -t nat -A LOG-OUTPUT-REDIRECT-9040 -p tcp -m tcp --tcp-flags FIN,SYN,RST,ACK SYN -j REDIRECT --to-ports 9040


$iptables -t filter -I OUTPUT 1 -d 127.0.0.0/8 -j LOG-ACCEPT-OUTPUT
$iptables -t filter -I OUTPUT 2 -d 192.168.0.0/16 -j LOG-ACCEPT-OUTPUT

#$ip6tables -t nat -I PREROUTING 1 ! -i lo -p tcp -m tcp --tcp-flags FIN,SYN,RST,ACK SYN -j REDIRECT --to-ports 9040
#$ip6tables -t nat -I OUTPUT 1 -m owner --uid-owner "tor" -j RETURN
#$ip6tables -t nat -I OUTPUT 2 -o lo -j RETURN
#$ip6tables -t nat -I OUTPUT 3 -p tcp -m tcp --dport 853 -j RETURN
#$ip6tables -t nat -I OUTPUT 4 -p tcp -m tcp --tcp-flags FIN,SYN,RST,ACK SYN -j REDIRECT --to-ports 9040

#$ip6tables -t filter -A OUTPUT -d ::1/8 -j LOG-ACCEPT-OUTPUT



