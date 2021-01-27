#!/bin/bash

source $(dirname $0)/uf.config.sh
echo "[ ii ] loading Policy DROP"

$iptables -t raw -P PREROUTING DROP
$iptables -t raw -P OUTPUT DROP

# The "nat" table is not intended for filtering, the use of DROP is therefore inhibited.
#$iptables -t nat -P PREROUTING DROP
#$iptables -t nat -P INPUT DROP
#$iptables -t nat -P OUTPUT DROP
#$iptables -t nat -P POSTROUTING DROP

$iptables -t mangle -P PREROUTING DROP
$iptables -t mangle -P INPUT DROP
$iptables -t mangle -P FORWARD DROP
$iptables -t mangle -P OUTPUT DROP
$iptables -t mangle -P POSTROUTING DROP

$iptables -t filter -P INPUT DROP
$iptables -t filter -P FORWARD DROP
$iptables -t filter -P OUTPUT DROP

$iptables -t security -P INPUT DROP
$iptables -t security -P FORWARD DROP
$iptables -t security -P OUTPUT DROP



$ip6tables -t raw -P PREROUTING DROP
$ip6tables -t raw -P OUTPUT DROP

# The "nat" table is not intended for filtering, the use of DROP is therefore inhibited.
#$ip6tables -t nat -P PREROUTING DROP
#$ip6tables -t nat -P INPUT DROP
#$ip6tables -t nat -P OUTPUT DROP
#$ip6tables -t nat -P POSTROUTING DROP

$ip6tables -t mangle -P PREROUTING DROP
$ip6tables -t mangle -P INPUT DROP
$ip6tables -t mangle -P FORWARD DROP
$ip6tables -t mangle -P OUTPUT DROP
$ip6tables -t mangle -P POSTROUTING DROP

$ip6tables -t filter -P INPUT DROP
$ip6tables -t filter -P FORWARD DROP
$ip6tables -t filter -P OUTPUT DROP

$ip6tables -t security -P INPUT DROP
$ip6tables -t security -P FORWARD DROP
$ip6tables -t security -P OUTPUT DROP



