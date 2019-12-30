#!/bin/bash
source $(dirname $0)/uf.config.sh

iptables -I INPUT 1 -i br0 -m state --state RELATED,ESTABLISHED -j LOG-ACCEPT-INPUT
iptables -I OUTPUT 1 -p tcp -m tcp --dport 22 -j LOG-ACCEPT-OUTPUT
