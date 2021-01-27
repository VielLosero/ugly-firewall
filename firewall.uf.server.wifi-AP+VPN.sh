#!/bin/bash

source $(dirname $0)/uf.config.sh
source $(dirname $0)/uf.config.interfaces.sh
#iptables=/sbin/iptables
#ip6tables=/sbin/ip6tables
#int=eth0

$(dirname $0)/iptables.flush.sh
$(dirname $0)/iptables.log.drop.sh

$(dirname $0)/rules.uf.output.ping.sh
$(dirname $0)/rules.uf.established.sh
$(dirname $0)/rules.uf.loopback.sh
$(dirname $0)/rules.uf.drop.sh
$(dirname $0)/rules.uf.server.ssh.sh
$(dirname $0)/rules.uf.server.dhcp.sh
$(dirname $0)/rules.uf.server.dns.sh
$(dirname $0)/rules.uf.masquerade.sh
$(dirname $0)/rules.uf.output.vpn.sh
$(dirname $0)/rules.uf.output.p2p.sh
$(dirname $0)/rules.uf.output.dns.sh






