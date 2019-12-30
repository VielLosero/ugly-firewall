#!/bin/bash

source $(dirname $0)/uf.config.sh

$iptables -t raw -N LOG-RAW-PREROUTING
$iptables -t raw -N LOG-RAW-OUTPUT

$iptables -t raw -A LOG-RAW-PREROUTING -m limit --limit 5/min -j LOG --log-uid --log-prefix "RAW-PRE " --log-level 7
$iptables -t raw -A LOG-RAW-OUTPUT -m limit --limit 5/min -j LOG --log-uid --log-prefix "RAW-OUT " --log-level 7

$iptables -t nat -I PREROUTING 1 -m limit --limit 5/min -j LOG --log-uid --log-prefix "NAT-PRE " --log-level 7
$iptables -t nat -I POSTROUTING 1 -m limit --limit 5/min -j LOG --log-uid --log-prefix "NAT-POST " --log-level 7
$iptables -t nat -I INPUT 1 -m limit --limit 5/min -j LOG --log-uid --log-prefix "NAT-IN " --log-level 7
$iptables -t nat -I OUTPUT 1 -m limit --limit 5/min -j LOG --log-uid --log-prefix "NAT-OUT " --log-level 7

#$iptables -t mangle -I PREROUTING 1 -m limit --limit 5/min -j LOG --log-uid --log-prefix "MANGLE-PRE " --log-level 7
#$iptables -t mangle -I INPUT 1 -m limit --limit 5/min -j LOG --log-uid --log-prefix "MANGLE-IN " --log-level 7
#$iptables -t mangle -I FORWARD 1 -m limit --limit 5/min -j LOG --log-uid --log-prefix "MANGLE-FORWARD " --log-level 7
#$iptables -t mangle -I OUTPUT 1 -m limit --limit 5/min -j LOG --log-uid --log-prefix "MANGLE-OUT " --log-level 7
#$iptables -t mangle -I POSTROUTING 1 -m limit --limit 5/min -j LOG --log-uid --log-prefix "MANGLE-POST " --log-level 7

#$iptables -t security -I INPUT 1 -m limit --limit 5/min -j LOG --log-uid --log-prefix "SEC-IN " --log-level 7
#$iptables -t security -I FORWARD 1 -m limit --limit 5/min -j LOG --log-uid --log-prefix "SEC-FORWARD " --log-level 7
#$iptables -t security -I OUTPUT 1 -m limit --limit 5/min -j LOG --log-uid --log-prefix "SEC-OUT " --log-level 7

$iptables -t filter -N LOG-ACCEPT-FORWARD 
$iptables -t filter -N LOG-ACCEPT-INPUT
$iptables -t filter -N LOG-ACCEPT-OUTPUT
$iptables -t filter -N LOG-DROP-FORWARD
$iptables -t filter -N LOG-DROP-INPUT
$iptables -t filter -N LOG-DROP-OUTPUT
$iptables -t filter -N LOG-REJECT-INPUT
$iptables -t filter -N LOG-REJECT-OUTPUT

$iptables -A LOG-ACCEPT-FORWARD -m limit --limit 5/min -j LOG --log-uid --log-prefix "ACCEPT_FORWARD " --log-level 7
$iptables -A LOG-ACCEPT-FORWARD -j ACCEPT
$iptables -A LOG-ACCEPT-INPUT -m limit --limit 5/min -j LOG  --log-uid --log-prefix "ACCEPT_INPUT " --log-level 7
$iptables -A LOG-ACCEPT-INPUT -j ACCEPT
$iptables -A LOG-ACCEPT-OUTPUT -m limit --limit 5/min -j LOG --log-uid --log-prefix "ACCEPT_OUTPUT " --log-level 7
$iptables -A LOG-ACCEPT-OUTPUT -j ACCEPT
$iptables -A LOG-DROP-FORWARD -m limit --limit 5/min -j LOG --log-uid --log-prefix "DROP_FORWARD " --log-level error
$iptables -A LOG-DROP-FORWARD -j DROP
$iptables -A LOG-DROP-INPUT -m limit --limit 5/min -j LOG --log-uid --log-prefix "DROP_INPUT " --log-level error
$iptables -A LOG-DROP-INPUT -j DROP
$iptables -A LOG-DROP-OUTPUT -m limit --limit 5/min -j LOG --log-uid --log-prefix "DROP_OUTPUT " --log-level error
$iptables -A LOG-DROP-OUTPUT -j DROP
$iptables -A LOG-REJECT-INPUT -m limit --limit 5/min -j LOG --log-uid --log-prefix "REJECT_INPUT " --log-level error
$iptables -A LOG-REJECT-INPUT -j REJECT --reject-with icmp-port-unreachable
$iptables -A LOG-REJECT-OUTPUT -m limit --limit 5/min -j LOG --log-uid --log-prefix "REJECT_OUTPUT " --log-level error
$iptables -A LOG-REJECT-OUTPUT -j REJECT --reject-with icmp-port-unreachable




$ip6tables -t raw -N LOG-RAW-PREROUTING
$ip6tables -t raw -N LOG-RAW-OUTPUT

$ip6tables -t raw -A LOG-RAW-PREROUTING -m limit --limit 5/min -j LOG --log-uid --log-prefix "IP6-RAW-PRE " --log-level 7
$ip6tables -t raw -A LOG-RAW-OUTPUT -m limit --limit 5/min -j LOG --log-uid --log-prefix "IP6-RAW-OUT " --log-level 7

$ip6tables -t nat -I PREROUTING 1 -m limit --limit 5/min -j LOG --log-uid --log-prefix "IP6-NAT-PRE " --log-level 7
$ip6tables -t nat -I POSTROUTING 1 -m limit --limit 5/min -j LOG --log-uid --log-prefix "IP6-NAT-POST " --log-level 7
$ip6tables -t nat -I INPUT 1 -m limit --limit 5/min -j LOG --log-uid --log-prefix "IP6-NAT-IN " --log-level 7
$ip6tables -t nat -I OUTPUT 1 -m limit --limit 5/min -j LOG --log-uid --log-prefix "IP6-NAT-OUT " --log-level 7

#$ip6tables -t mangle -I PREROUTING 1 -m limit --limit 5/min -j LOG --log-uid --log-prefix "IP6-MANGLE-PRE " --log-level 7
#$ip6tables -t mangle -I INPUT 1 -m limit --limit 5/min -j LOG --log-uid --log-prefix "IP6-MANGLE-IN " --log-level 7
#$ip6tables -t mangle -I FORWARD 1 -m limit --limit 5/min -j LOG --log-uid --log-prefix "IP6-MANGLE-FORWARD " --log-level 7
#$ip6tables -t mangle -I OUTPUT 1 -m limit --limit 5/min -j LOG --log-uid --log-prefix "IP6-MANGLE-OUT " --log-level 7
#$ip6tables -t mangle -I POSTROUTING 1 -m limit --limit 5/min -j LOG --log-uid --log-prefix "IP6-MANGLE-POST " --log-level 7

#$ip6tables -t security -I INPUT 1 -m limit --limit 5/min -j LOG --log-uid --log-prefix "IP6-SEC-IN " --log-level 7
#$ip6tables -t security -I FORWARD 1 -m limit --limit 5/min -j LOG --log-uid --log-prefix "IP6-SEC-FORWARD " --log-level 7
#$ip6tables -t security -I OUTPUT 1  -m limit --limit 5/min -j LOG --log-uid --log-prefix "IP6-SEC-OUT " --log-level 7

$ip6tables -t filter -N LOG-ACCEPT-FORWARD 
$ip6tables -t filter -N LOG-ACCEPT-INPUT
$ip6tables -t filter -N LOG-ACCEPT-OUTPUT
$ip6tables -t filter -N LOG-DROP-FORWARD
$ip6tables -t filter -N LOG-DROP-INPUT
$ip6tables -t filter -N LOG-DROP-OUTPUT
$ip6tables -t filter -N LOG-REJECT-INPUT
$ip6tables -t filter -N LOG-REJECT-OUTPUT

$ip6tables -A LOG-ACCEPT-FORWARD -m limit --limit 5/min -j LOG --log-uid --log-prefix "IP6-ACCEPT_FORWARD " --log-level 7
$ip6tables -A LOG-ACCEPT-FORWARD -j ACCEPT
$ip6tables -A LOG-ACCEPT-INPUT -m limit --limit 5/min -j LOG  --log-uid --log-prefix "IP6-ACCEPT_INPUT " --log-level 7
$ip6tables -A LOG-ACCEPT-INPUT -j ACCEPT
$ip6tables -A LOG-ACCEPT-OUTPUT -m limit --limit 5/min -j LOG --log-uid --log-prefix "IP6-ACCEPT_OUTPUT " --log-level 7
$ip6tables -A LOG-ACCEPT-OUTPUT -j ACCEPT
$ip6tables -A LOG-DROP-FORWARD -m limit --limit 5/min -j LOG --log-uid --log-prefix "IP6-DROP_FORWARD " --log-level error
$ip6tables -A LOG-DROP-FORWARD -j DROP
$ip6tables -A LOG-DROP-INPUT -m limit --limit 5/min -j LOG --log-uid --log-prefix "IP6-DROP_INPUT " --log-level error
$ip6tables -A LOG-DROP-INPUT -j DROP
$ip6tables -A LOG-DROP-OUTPUT -m limit --limit 5/min -j LOG --log-uid --log-prefix "IP6-DROP_OUTPUT " --log-level error
$ip6tables -A LOG-DROP-OUTPUT -j DROP
$ip6tables -A LOG-REJECT-INPUT -m limit --limit 5/min -j LOG --log-uid --log-prefix "IP6-REJECT_INPUT " --log-level error
$ip6tables -A LOG-REJECT-INPUT -j REJECT
$ip6tables -A LOG-REJECT-OUTPUT -m limit --limit 5/min -j LOG --log-uid --log-prefix "IP6-REJECT_OUTPUT " --log-level error
$ip6tables -A LOG-REJECT-OUTPUT -j REJECT





