#!/bin/bash

source $(dirname $0)/uf.config.sh


$iptables -I OUTPUT 1 -o $out_int -j LOG-ACCEPT-OUTPUT



$ip6tables -I OUTPUT 1 -o $out_int -j LOG-ACCEPT-OUTPUT




