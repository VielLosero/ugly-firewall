#!/bin/bash

source $(dirname $0)/uf.config.sh
echo "[ ++ ] loading LOG tables and chains for match ALL"

$iptables -t raw -N LOG-RAW-PRE
$iptables -t raw -N LOG-RAW-OUT

$iptables -t raw -A PREROUTING -j LOG-RAW-PRE
$iptables -t raw -A LOG-RAW-PRE -m limit --limit 5/min -j LOG --log-uid --log-prefix "RAW-PRE " --log-level 7
$iptables -t raw -A OUTPUT -j LOG-RAW-OUT
$iptables -t raw -A LOG-RAW-OUT -m limit --limit 5/min -j LOG --log-uid --log-prefix "RAW-OUT " --log-level 7


$iptables -t nat -N LOG-NAT-PRE
$iptables -t nat -N LOG-NAT-POST
$iptables -t nat -N LOG-NAT-IN
$iptables -t nat -N LOG-NAT-OUT

$iptables -t nat -A PREROUTING -j LOG-NAT-PRE
$iptables -t nat -A LOG-NAT-PRE -m limit --limit 5/min -j LOG --log-uid --log-prefix "NAT-PRE " --log-level 7
$iptables -t nat -A POSTROUTING -j LOG-NAT-POST
$iptables -t nat -A LOG-NAT-POST -m limit --limit 5/min -j LOG --log-uid --log-prefix "NAT-POST " --log-level 7
$iptables -t nat -A INPUT -j LOG-NAT-IN
$iptables -t nat -A LOG-NAT-IN -m limit --limit 5/min -j LOG --log-uid --log-prefix "NAT-IN " --log-level 7
$iptables -t nat -A OUTPUT -j LOG-NAT-OUT
$iptables -t nat -A LOG-NAT-OUT -m limit --limit 5/min -j LOG --log-uid --log-prefix "NAT-OUT " --log-level 7

$iptables -t mangle -N LOG-MAN-PRE
$iptables -t mangle -N LOG-MAN-POST
$iptables -t mangle -N LOG-MAN-IN
$iptables -t mangle -N LOG-MAN-OUT

$iptables -t mangle -A PREROUTING -j LOG-MAN-PRE
$iptables -t mangle -A LOG-MAN-PRE -m limit --limit 5/min -j LOG --log-uid --log-prefix "MAN-PRE " --log-level 7
$iptables -t mangle -A POSTROUTING -j LOG-MAN-POST
$iptables -t mangle -A LOG-MAN-POST -m limit --limit 5/min -j LOG --log-uid --log-prefix "MAN-POST " --log-level 7
$iptables -t mangle -A INPUT -j LOG-MAN-IN
$iptables -t mangle -A LOG-MAN-IN -m limit --limit 5/min -j LOG --log-uid --log-prefix "MAN-IN " --log-level 7
$iptables -t mangle -A OUTPUT -j LOG-MAN-OUT
$iptables -t mangle -A LOG-MAN-OUT -m limit --limit 5/min -j LOG --log-uid --log-prefix "MAN-OUT " --log-level 7

$iptables -t security -N LOG-SEC-IN
$iptables -t security -N LOG-SEC-FORWARD
$iptables -t security -N LOG-SEC-OUT

$iptables -t security -A INPUT -j LOG-SEC-IN
$iptables -t security -A LOG-SEC-IN -m limit --limit 5/min -j LOG --log-uid --log-prefix "SEC-IN " --log-level 7
$iptables -t security -A FORWARD -j LOG-SEC-FORWARD
$iptables -t security -A LOG-SEC-FORWARD -m limit --limit 5/min -j LOG --log-uid --log-prefix "SEC-FORWARD " --log-level 7
$iptables -t security -A OUTPUT -j LOG-SEC-OUT
$iptables -t security -A LOG-SEC-OUT -m limit --limit 5/min -j LOG --log-uid --log-prefix "SEC-OUT " --log-level 7

$iptables -t filter -N LOG-FIL-FORWARD-ACCEPT 
$iptables -t filter -N LOG-FIL-FORWARD-DROP
$iptables -t filter -N LOG-FIL-IN-ACCEPT
$iptables -t filter -N LOG-FIL-IN-DROP
$iptables -t filter -N LOG-FIL-IN-REJECT
$iptables -t filter -N LOG-FIL-OUT-ACCEPT
$iptables -t filter -N LOG-FIL-OUT-DROP
$iptables -t filter -N LOG-FIL-OUT-REJECT

$iptables -A LOG-FIL-FORWARD-ACCEPT -m limit --limit 5/min -j LOG --log-uid --log-prefix "ACCEPT_FORWARD " --log-level 7
$iptables -A LOG-FIL-FORWARD-ACCEPT -j ACCEPT
$iptables -A LOG-FIL-IN-ACCEPT -m limit --limit 5/min -j LOG  --log-uid --log-prefix "ACCEPT_INPUT " --log-level 7
$iptables -A LOG-FIL-IN-ACCEPT -j ACCEPT
$iptables -A LOG-FIL-OUT-ACCEPT -m limit --limit 5/min -j LOG --log-uid --log-prefix "ACCEPT_OUTPUT " --log-level 7
$iptables -A LOG-FIL-OUT-ACCEPT -j ACCEPT
$iptables -A LOG-FIL-FORWARD-DROP -m limit --limit 5/min -j LOG --log-uid --log-prefix "DROP_FORWARD " --log-level error
$iptables -A LOG-FIL-FORWARD-DROP -j DROP
$iptables -A LOG-FIL-IN-DROP -m limit --limit 5/min -j LOG --log-uid --log-prefix "DROP_INPUT " --log-level error
$iptables -A LOG-FIL-IN-DROP -j DROP
$iptables -A LOG-FIL-OUT-DROP -m limit --limit 5/min -j LOG --log-uid --log-prefix "DROP_OUTPUT " --log-level error
$iptables -A LOG-FIL-OUT-DROP -j DROP
$iptables -A LOG-FIL-IN-REJECT -m limit --limit 5/min -j LOG --log-uid --log-prefix "REJECT_INPUT " --log-level error
$iptables -A LOG-FIL-IN-REJECT -j REJECT --reject-with icmp-port-unreachable
$iptables -A LOG-FIL-OUT-REJECT -m limit --limit 5/min -j LOG --log-uid --log-prefix "REJECT_OUTPUT " --log-level error
$iptables -A LOG-FIL-OUT-REJECT -j REJECT --reject-with icmp-port-unreachable




$ip6tables -t raw -N LOG-RAW-PRE
$ip6tables -t raw -N LOG-RAW-OUT

$ip6tables -t raw -A PREROUTING -j LOG-RAW-PRE
$ip6tables -t raw -A LOG-RAW-PRE -m limit --limit 5/min -j LOG --log-uid --log-prefix "IP6-RAW-PRE " --log-level 7
$ip6tables -t raw -A OUTPUT -j LOG-RAW-OUT
$ip6tables -t raw -A LOG-RAW-OUT -m limit --limit 5/min -j LOG --log-uid --log-prefix "IP6-RAW-OUT " --log-level 7

$ip6tables -t nat -N LOG-NAT-PRE
$ip6tables -t nat -N LOG-NAT-POST
$ip6tables -t nat -N LOG-NAT-IN
$ip6tables -t nat -N LOG-NAT-OUT

$ip6tables -t nat -A PREROUTING -j LOG-NAT-PRE
$ip6tables -t nat -A LOG-NAT-PRE -m limit --limit 5/min -j LOG --log-uid --log-prefix "IP6-NAT-PRE " --log-level 7
$ip6tables -t nat -A POSTROUTING -j LOG-NAT-POST
$ip6tables -t nat -A LOG-NAT-POST -m limit --limit 5/min -j LOG --log-uid --log-prefix "IP6-NAT-POST " --log-level 7
$ip6tables -t nat -A INPUT -j LOG-NAT-IN
$ip6tables -t nat -A LOG-NAT-IN -m limit --limit 5/min -j LOG --log-uid --log-prefix "IP6-NAT-IN " --log-level 7
$ip6tables -t nat -A OUTPUT -j LOG-NAT-OUT
$ip6tables -t nat -A LOG-NAT-OUT -m limit --limit 5/min -j LOG --log-uid --log-prefix "IP6-NAT-OUT " --log-level 7

$ip6tables -t mangle -N LOG-MAN-PRE
$ip6tables -t mangle -N LOG-MAN-POST
$ip6tables -t mangle -N LOG-MAN-IN
$ip6tables -t mangle -N LOG-MAN-OUT

$ip6tables -t mangle -A PREROUTING -j LOG-MAN-PRE
$ip6tables -t mangle -A LOG-MAN-PRE -m limit --limit 5/min -j LOG --log-uid --log-prefix "IP6-MAN-PRE " --log-level 7
$ip6tables -t mangle -A POSTROUTING -j LOG-MAN-POST
$ip6tables -t mangle -A LOG-MAN-POST -m limit --limit 5/min -j LOG --log-uid --log-prefix "IP6-MAN-POST " --log-level 7
$ip6tables -t mangle -A INPUT -j LOG-MAN-IN
$ip6tables -t mangle -A LOG-MAN-IN -m limit --limit 5/min -j LOG --log-uid --log-prefix "IP6-MAN-IN " --log-level 7
$ip6tables -t mangle -A OUTPUT -j LOG-MAN-OUT
$ip6tables -t mangle -A LOG-MAN-OUT -m limit --limit 5/min -j LOG --log-uid --log-prefix "IP6-MAN-OUT " --log-level 7

$ip6tables -t security -N LOG-SEC-IN
$ip6tables -t security -N LOG-SEC-FORWARD
$ip6tables -t security -N LOG-SEC-OUT

$ip6tables -t security -A INPUT -j LOG-SEC-IN
$ip6tables -t security -A LOG-SEC-IN -m limit --limit 5/min -j LOG --log-uid --log-prefix "IP6-SEC-IN " --log-level 7
$ip6tables -t security -A FORWARD -j LOG-SEC-FORWARD
$ip6tables -t security -A LOG-SEC-FORWARD -m limit --limit 5/min -j LOG --log-uid --log-prefix "IP6-SEC-FORWARD " --log-level 7
$ip6tables -t security -A OUTPUT -j LOG-SEC-OUT
$ip6tables -t security -A LOG-SEC-OUT -m limit --limit 5/min -j LOG --log-uid --log-prefix "IP6-SEC-OUT " --log-level 7

$ip6tables -t filter -N LOG-FIL-FORWARD-ACCEPT 
$ip6tables -t filter -N LOG-FIL-FORWARD-DROP
$ip6tables -t filter -N LOG-FIL-IN-ACCEPT
$ip6tables -t filter -N LOG-FIL-IN-DROP
$ip6tables -t filter -N LOG-FIL-IN-REJECT
$ip6tables -t filter -N LOG-FIL-OUT-ACCEPT
$ip6tables -t filter -N LOG-FIL-OUT-DROP
$ip6tables -t filter -N LOG-FIL-OUT-REJECT

$ip6tables -A LOG-FIL-FORWARD-ACCEPT -m limit --limit 5/min -j LOG --log-uid --log-prefix "IP6-ACCEPT_FORWARD " --log-level 7
$ip6tables -A LOG-FIL-FORWARD-ACCEPT -j ACCEPT
$ip6tables -A LOG-FIL-IN-ACCEPT -m limit --limit 5/min -j LOG  --log-uid --log-prefix "IP6-ACCEPT_INPUT " --log-level 7
$ip6tables -A LOG-FIL-IN-ACCEPT -j ACCEPT
$ip6tables -A LOG-FIL-OUT-ACCEPT -m limit --limit 5/min -j LOG --log-uid --log-prefix "IP6-ACCEPT_OUTPUT " --log-level 7
$ip6tables -A LOG-FIL-OUT-ACCEPT -j ACCEPT
$ip6tables -A LOG-FIL-FORWARD-DROP -m limit --limit 5/min -j LOG --log-uid --log-prefix "IP6-DROP_FORWARD " --log-level error
$ip6tables -A LOG-FIL-FORWARD-DROP -j DROP
$ip6tables -A LOG-FIL-IN-DROP -m limit --limit 5/min -j LOG --log-uid --log-prefix "IP6-DROP_INPUT " --log-level error
$ip6tables -A LOG-FIL-IN-DROP -j DROP
$ip6tables -A LOG-FIL-OUT-DROP -m limit --limit 5/min -j LOG --log-uid --log-prefix "IP6-DROP_OUTPUT " --log-level error
$ip6tables -A LOG-FIL-OUT-DROP -j DROP
$ip6tables -A LOG-FIL-IN-REJECT -m limit --limit 5/min -j LOG --log-uid --log-prefix "IP6-REJECT_INPUT " --log-level error
$ip6tables -A LOG-FIL-IN-REJECT -j REJECT
$ip6tables -A LOG-FIL-OUT-REJECT -m limit --limit 5/min -j LOG --log-uid --log-prefix "IP6-REJECT_OUTPUT " --log-level error
$ip6tables -A LOG-FIL-OUT-REJECT -j REJECT





