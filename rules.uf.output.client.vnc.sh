#!/bin/bash

ACTION=$1
source $(dirname $0)/uf.config.sh
source $(dirname $0)/uf.config.interfaces.sh

iptables $ACTION_OUTPUT -p tcp -m tcp --dport 5900 -j LOG-FIL-OUT-ACCEPT
