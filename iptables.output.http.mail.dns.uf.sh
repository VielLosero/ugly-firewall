#!/bin/bash

source $(dirname $0)/uf.config.sh

$iptables -I OUTPUT 1 -o $out_int -p udp -m udp --dport 53 -j LOG-ACCEPT-OUTPUT
$iptables -I OUTPUT 2 -o $out_int -p tcp -m tcp --dport 80 -j LOG-ACCEPT-OUTPUT
$iptables -I OUTPUT 3 -o $out_int -p tcp -m tcp --dport 443 -j LOG-ACCEPT-OUTPUT
$iptables -I OUTPUT 4 -o $out_int -p tcp -m tcp --dport 995 -j LOG-ACCEPT-OUTPUT
$iptables -I OUTPUT 5 -o $out_int -p tcp -m tcp --dport 993 -j LOG-ACCEPT-OUTPUT
$iptables -I OUTPUT 6 -o $out_int -p tcp -m tcp --dport 587 -j LOG-ACCEPT-OUTPUT
$iptables -I OUTPUT 7 -o $out_int -p tcp -m tcp --dport 465 -j LOG-ACCEPT-OUTPUT



$ip6tables -I OUTPUT 1 -o $out_int -p udp -m udp --dport 53 -j LOG-ACCEPT-OUTPUT
$ip6tables -I OUTPUT 2 -o $out_int -p tcp -m tcp --dport 80 -j LOG-ACCEPT-OUTPUT
$ip6tables -I OUTPUT 3 -o $out_int -p tcp -m tcp --dport 443 -j LOG-ACCEPT-OUTPUT
$ip6tables -I OUTPUT 4 -o $out_int -p tcp -m tcp --dport 995 -j LOG-ACCEPT-OUTPUT
$ip6tables -I OUTPUT 5 -o $out_int -p tcp -m tcp --dport 993 -j LOG-ACCEPT-OUTPUT
$ip6tables -I OUTPUT 6 -o $out_int -p tcp -m tcp --dport 587 -j LOG-ACCEPT-OUTPUT
$ip6tables -I OUTPUT 7 -o $out_int -p tcp -m tcp --dport 465 -j LOG-ACCEPT-OUTPUT




