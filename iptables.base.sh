#!/bin/bash

source $(dirname $0)/uf.config.sh
#iptables=/sbin/iptables
#ip6tables=/sbin/ip6tables
#int=eth0

$iptables -t raw -A PREROUTING -j LOG-RAW-PREROUTING
$iptables -t raw -A OUTPUT -j LOG-RAW-OUTPUT

#$iptables -A INPUT -p icmp -j LOG-ACCEPT-INPUT
$iptables -A INPUT -d 127.0.0.0/8 ! -i lo -j LOG-DROP-INPUT
$iptables -A INPUT -i lo -j LOG-ACCEPT-INPUT
#$iptables -A INPUT -i $int -m state --state RELATED,ESTABLISHED -j LOG-ACCEPT-INPUT
$iptables -A INPUT -m conntrack --ctstate RELATED,ESTABLISHED -j LOG-ACCEPT-INPUT
$iptables -A INPUT -i $in_int -m state --state INVALID,NEW -j LOG-DROP-INPUT
$iptables -A INPUT -m conntrack --ctstate INVALID -j LOG-DROP-INPUT
$iptables -A INPUT -j LOG-DROP-INPUT

$iptables -A FORWARD -j LOG-DROP-FORWARD

#$iptables -A OUTPUT -d 127.0.0.0/8 -j LOG-ACCEPT-OUTPUT
$iptables -A OUTPUT -d 127.0.0.1/32 -o lo -j LOG-ACCEPT-OUTPUT
#$iptables -A OUTPUT -m conntrack --ctstate RELATED,ESTABLISHED -j LOG-ACCEPT-OUTPUT
$iptables -A OUTPUT -p udp -m udp --sport 68 -j LOG-ACCEPT-OUTPUT
$iptables -A OUTPUT -p icmp -j LOG-ACCEPT-OUTPUT
#$iptables -A OUTPUT -o $int -p tcp -m tcp --dport 80 -j LOG-ACCEPT-OUTPUT
#$iptables -A OUTPUT -o $int -p tcp -m tcp --dport 443 -j LOG-ACCEPT-OUTPUT
#$iptables -A OUTPUT -o $int -p udp -m udp --dport 53 -j LOG-ACCEPT-OUTPUT
#$iptables -A OUTPUT -o $int -p tcp -m tcp --dport 853 -j LOG-ACCEPT-OUTPUT
#$iptables -A OUTPUT -m owner --uid-owner 64707 -j LOG-ACCEPT-OUTPUT 
$iptables -A OUTPUT -j LOG-DROP-OUTPUT




$ip6tables -t raw -A PREROUTING -j LOG-RAW-PREROUTING
$ip6tables -t raw -A OUTPUT -j LOG-RAW-OUTPUT

#$ip6tables -A INPUT -p icmp -j LOG-ACCEPT-INPUT
$ip6tables -A INPUT -d ::1 ! -i lo -j LOG-DROP-INPUT
$ip6tables -A INPUT -i lo -j LOG-ACCEPT-INPUT
#$ip6tables -A INPUT -i $int -m state --state RELATED,ESTABLISHED -j LOG-ACCEPT-INPUT
$ip6tables -A INPUT -m conntrack --ctstate RELATED,ESTABLISHED -j LOG-ACCEPT-INPUT
$ip6tables -A INPUT -i $in_int -m state --state INVALID,NEW -j LOG-DROP-INPUT
$ip6tables -A INPUT -m conntrack --ctstate INVALID -j LOG-DROP-INPUT
$ip6tables -A INPUT -j LOG-DROP-INPUT

$ip6tables -A FORWARD -j LOG-DROP-FORWARD

$ip6tables --ipv6 -A OUTPUT -d ::1/64 -j LOG-ACCEPT-OUTPUT
#$ip6tables -A OUTPUT -m conntrack --ctstate RELATED,ESTABLISHED -j LOG-ACCEPT-OUTPUT
$ip6tables -A OUTPUT -p udp -m udp --sport 546 -j LOG-ACCEPT-OUTPUT
$ip6tables -A OUTPUT -p icmp -j LOG-ACCEPT-OUTPUT
#$ip6tables -A OUTPUT -o $int -p tcp -m tcp --dport 80 -j LOG-ACCEPT-OUTPUT
#$ip6tables -A OUTPUT -o $int -p tcp -m tcp --dport 443 -j LOG-ACCEPT-OUTPUT
#$ip6tables -A OUTPUT -o $int -p udp -m udp --dport 53 -j LOG-ACCEPT-OUTPUT
#$ip6tables -A OUTPUT -o $int -p tcp -m tcp --dport 853 -j LOG-ACCEPT-OUTPUT
$ip6tables -A OUTPUT -j LOG-DROP-OUTPUT




