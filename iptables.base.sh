#!/bin/bash

source $(dirname $0)/uf.config.sh
source $(dirname $0)/uf.config.interfaces.sh
echo "[ ** ] loading BASE tables and chains"

$(dirname $0)/rules.uf.output.ping.sh
$(dirname $0)/rules.uf.established.sh
$(dirname $0)/rules.uf.loopback.sh
$(dirname $0)/rules.uf.drop.sh



