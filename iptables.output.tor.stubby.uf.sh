#!/bin/bash

source $(dirname $0)/uf.config.sh

$iptables -I OUTPUT 1 -o $out_int -m owner --uid-owner $tor -j LOG-ACCEPT-OUTPUT
$iptables -I OUTPUT 2 -o $out_int -p tcp -m tcp --dport 853 -j LOG-ACCEPT-OUTPUT
#$iptables -I OUTPUT 2 -o $out_int -m owner --uid-owner "stubby" -j LOG-ACCEPT-OUTPUT


$ip6tables -I OUTPUT 1 -o $out_int -m owner --uid-owner $tor -j LOG-ACCEPT-OUTPUT
$ip6tables -I OUTPUT 2 -o $out_int -p tcp -m tcp --dport 853 -j LOG-ACCEPT-OUTPUT
#$ip6tables -I OUTPUT 2 -o $out_int -m owner --uid-owner "stubby" -j LOG-ACCEPT-OUTPUT




