#!/bin/bash

source $(dirname $0)/uf.config.sh
source $(dirname $0)/uf.config.interfaces.sh
echo -e "[ ii ] loading BASE SERVER tables and chains"

$(dirname $0)/rules.uf.established.sh
$(dirname $0)/rules.uf.loopback.sh
$(dirname $0)/rules.uf.drop.sh
$(dirname $0)/rules.uf.output.ping.sh
$(dirname $0)/rules.uf.server.ssh.sh
$(dirname $0)/rules.uf.output.dns.sh
$(dirname $0)/rules.uf.output.ntp.sh
$(dirname $0)/rules.uf.output.http.https.sh



