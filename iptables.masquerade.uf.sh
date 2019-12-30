#!/bin/bash

source $(dirname $0)/uf.config.sh

$iptables -t nat -N LOG-POSTROUTING-MASQUERADE
$iptables -t nat -A POSTROUTING -s 192.168.2.0/24 -o $out_int -j LOG-POSTROUTING-MASQUERADE
$iptables -t nat -A LOG-POSTROUTING-MASQUERADE -j MASQUERADE

$iptables -I FORWARD 1 -s 192.168.2.0/24 -j LOG-ACCEPT-FORWARD
$iptables -I FORWARD 2 -m state --state RELATED,ESTABLISHED -j LOG-ACCEPT-FORWARD




