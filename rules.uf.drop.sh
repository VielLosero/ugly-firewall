#!/bin/bash

ACTION=$1
source $(dirname $0)/uf.config.sh
source $(dirname $0)/uf.config.interfaces.sh
echo -e "$ACT $(basename $0)"

$iptables -A INPUT -j LOG-FIL-IN-DROP
$iptables -A FORWARD -j LOG-FIL-FORWARD-DROP
$iptables -A OUTPUT -j LOG-FIL-OUT-DROP


$ip6tables -A INPUT -j LOG-FIL-IN-DROP
$ip6tables -A FORWARD -j LOG-FIL-FORWARD-DROP
# to prevent write the log file with lots of deny icmpv6 port 133 arp request neigtbours
$ip6tables -A OUTPUT -p icmpv6 --icmpv6-type neighbor-solicitation -j DROP
$ip6tables -A OUTPUT -j LOG-FIL-OUT-DROP
