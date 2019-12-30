#!/bin/bash

source $(dirname $0)/uf.config.sh

echo " [*] flushing ip4 and ip6, all tables and chains"
for table in ${tables[@]}; do
$iptables -t $table -F; $iptables -t $table -X
$ip6tables -t $table -F; $ip6tables -t $table -X
done


