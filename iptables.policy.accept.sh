#!/bin/bash

source $(dirname $0)/uf.config.sh
echo "[ ii ] loading Policy ACCEPT"

$iptables -t raw -P PREROUTING ACCEPT
$iptables -t raw -P OUTPUT ACCEPT

$iptables -t nat -P PREROUTING ACCEPT
$iptables -t nat -P INPUT ACCEPT
$iptables -t nat -P OUTPUT ACCEPT
$iptables -t nat -P POSTROUTING ACCEPT

$iptables -t mangle -P PREROUTING ACCEPT
$iptables -t mangle -P INPUT ACCEPT
$iptables -t mangle -P FORWARD ACCEPT
$iptables -t mangle -P OUTPUT ACCEPT
$iptables -t mangle -P POSTROUTING ACCEPT

$iptables -t filter -P INPUT ACCEPT
$iptables -t filter -P FORWARD ACCEPT
$iptables -t filter -P OUTPUT ACCEPT

$iptables -t security -P INPUT ACCEPT
$iptables -t security -P FORWARD ACCEPT
$iptables -t security -P OUTPUT ACCEPT



$ip6tables -t raw -P PREROUTING ACCEPT
$ip6tables -t raw -P OUTPUT ACCEPT

$ip6tables -t nat -P PREROUTING ACCEPT
$ip6tables -t nat -P INPUT ACCEPT
$ip6tables -t nat -P OUTPUT ACCEPT
$ip6tables -t nat -P POSTROUTING ACCEPT

$ip6tables -t mangle -P PREROUTING ACCEPT
$ip6tables -t mangle -P INPUT ACCEPT
$ip6tables -t mangle -P FORWARD ACCEPT
$ip6tables -t mangle -P OUTPUT ACCEPT
$ip6tables -t mangle -P POSTROUTING ACCEPT

$ip6tables -t filter -P INPUT ACCEPT
$ip6tables -t filter -P FORWARD ACCEPT
$ip6tables -t filter -P OUTPUT ACCEPT

$ip6tables -t security -P INPUT ACCEPT
$ip6tables -t security -P FORWARD ACCEPT
$ip6tables -t security -P OUTPUT ACCEPT



