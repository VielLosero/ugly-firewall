#!/bin/bash

#Ugly-Firewall config file

############################################
# Variables 
############################################

RUN="[\e[1;34m*\e[00m]"
FAIL="[\e[1;31mfailed\e[00m]"
OK="[\e[1;32mok\e[00m]"

WAN=eth0
in_int=eth0
out_int=eth0
iptables=/sbin/iptables
ip6tables=/sbin/ip6tables

show_ip4=1
show_ip6=1

tables=(raw nat mangle security filter)

[[ $(id debian-tor) ]] && tor=$(id -u debian-tor) || tor=$(id -u tor)
#[[ $(id stubby) ]] && stubby=$(id -u stubby) || stubby=stubby

