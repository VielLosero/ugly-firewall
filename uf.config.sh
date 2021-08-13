#!/bin/bash

#Ugly-Firewall config file

############################################
# Variables 
############################################

RUN="[\e[1;34m ** \e[00m]"
FAIL="[\e[1;31mfail\e[00m]"
OK="[\e[1;32m ok \e[00m]"
ACT="[\e[1;32m ++ \e[00m]"

ACTION_INPUT="-I INPUT 1"
ACTION_FORWARD="-I FORWARD 1"
ACTION_OUTPUT="-I OUTPUT 1"
ACTION_PREROUTING="-I PREROUTING 1"
ACTION_POSTROUTING="-I POSTROUTING 1"
if [ "$ACTION" == "DEL" ] ; then
	ACT="[\e[1;31m -- \e[00m]"
	ACTION_INPUT="-D INPUT"
	ACTION_FORWARD="-D FORWARD"
	ACTION_OUTPUT="-D OUTPUT"
	ACTION_PREROUTING="-D PREROUTING"
	ACTION_POSTROUTING="-D POSTROUTING"
fi

#arch
#iptables=/sbin/iptables
#ip6tables=/sbin/ip6tables
#slackware
iptables=/usr/sbin/iptables
ip6tables=/usr/sbin/ip6tables


show_ip4=1
show_ip6=1

log_lvl=0

tables=(raw nat mangle security filter)

if [ "$(cat /etc/hostname)" == "ohm" ] ; then
	tables=(raw nat mangle filter)
fi

#if  [ $(id -u debian-tor 2>/dev/null || echo -1) -ge 0 ]  ; then tor=$(id -u debian-tor); else tor=$(id -u tor) ;fi
tor=$(id -u debian-tor 2>/dev/null || id -u tor 2>/dev/null)
stubby=$( id -u stubby 2>/dev/null || echo stubby)
#[[ $(id stubby) ]] && stubby=$(id -u stubby) || stubby=stubby

