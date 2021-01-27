# Ugly Firewall

This is mi scripts to manage linux netfilter iptables, i tried to do not install 3th tools that can't do what i want, are ultra complicated, or need compiled code to run as binarys files, adding more layers to netfilter tools. It is easy to read a simple bash script to see what it do, and only with few lines of code and some organized files we can manage our firewall in linux.

There isn't a tool/script to manage iptables whitout know how iptables works, to make custom rulescripts to load it is hight recomended to learn a few of iptables.

## How it works

Macking some user chains like LOG-ACCEPT-OUTPUT to jump in when packet match and grep only rules with our LOG- prefix to show status.

A base rulescript file that can be customized with our own policy to drop all, permit only loopback, permit only output packeds, etc.

Some custom user rulescript files like **iptables.output.http.https.dns.uf.sh** to easy load fast some prebuild rules we need.

And more.

## Getting Started

These instructions will get you a copy of the project.

### Installing
git clone https://github.com/VielLosero/ugly-firewall.git                                                              

```shell
root@kali:~/data/git-repos/vielLosero# git clone https://github.com/VielLosero/ugly-firewall.git                                                              
Clonando en 'ugly-firewall'...                                                                                                                                
remote: Enumerating objects: 4, done.                                                                                                                         
remote: Counting objects: 100% (4/4), done.                                                                                                                   
remote: Compressing objects: 100% (4/4), done.                                                                                                                
remote: Total 4 (delta 0), reused 0 (delta 0), pack-reused 0                                                                                                  
Desempaquetando objetos: 100% (4/4), listo.                  
```

## Running ugly-firewall

After cloning the repository change to ugly-firewall dir and run ./uf

Or make a link for easy run: ln -s PATH/ugly-firewall/uf /usr/bin/fw

```shell
root@kali:~# cd ugly-firewall/                                                                         
root@kali:~/ugly-firewall# ./uf

root@kali:~# fw                                                                                                                              
```

### Output While Running

```shell
UGLY-FIREWALL: [quit] [zero-counters] [flush] [base] [load] [policy] [ip4] [ip6] [log_lvl] [interfaces]
INTERFACES: WAN:eth0 LAN:bond0 VPN:tun0 in_int:bond0 out_in:tun0
ip4 pkts bytes target     prot opt in     out     source               destination
10252   10M LOG-RAW-PRE  all  --  *      *       0.0.0.0/0            0.0.0.0/0
11283  847K LOG-RAW-OUT  all  --  *      *       0.0.0.0/0            0.0.0.0/0
    0     0 LOG-FIL-IN-DROP  all  --  !lo    *       0.0.0.0/0            127.0.0.0/8
  404 41168 LOG-FIL-IN-ACCEPT  all  --  lo     *       0.0.0.0/0            0.0.0.0/0
 9847   10M LOG-FIL-IN-ACCEPT  all  --  *      *       0.0.0.0/0            0.0.0.0/0            ctstate RELATED,ESTABLISHED
    1   328 LOG-FIL-IN-DROP  all  --  *      *       0.0.0.0/0            0.0.0.0/0            ctstate INVALID,NEW
    0     0 LOG-FIL-IN-DROP  all  --  *      *       0.0.0.0/0            0.0.0.0/0
    0     0 LOG-FIL-FORWARD-DROP  all  --  *      *       0.0.0.0/0            0.0.0.0/0
 3955  311K LOG-FIL-OUT-ACCEPT  tcp  --  *      wlan0   0.0.0.0/0            0.0.0.0/0            tcp dpt:443 state NEW,ESTABLISHED
  208 15747 LOG-FIL-OUT-ACCEPT  tcp  --  *      wlan0   0.0.0.0/0            0.0.0.0/0            tcp dpt:80 state NEW,ESTABLISHED
    0     0 LOG-FIL-OUT-ACCEPT  tcp  --  *      wlan0   0.0.0.0/0            0.0.0.0/0            tcp dpt:53 owner UID match 972
  653 47640 LOG-FIL-OUT-ACCEPT  udp  --  *      wlan0   0.0.0.0/0            0.0.0.0/0            udp dpt:53 owner UID match 972
 5995  414K LOG-FIL-OUT-ACCEPT  tcp  --  *      *       0.0.0.0/0            0.0.0.0/0            tcp dpt:22 state NEW,ESTABLISHED
  404 41168 LOG-FIL-OUT-ACCEPT  all  --  *      lo      0.0.0.0/0            127.0.0.1
   68 17021 LOG-FIL-OUT-DROP  all  --  *      *       0.0.0.0/0            0.0.0.0/0
ip6 pkts bytes target     prot opt in     out     source               destination
    0     0 LOG-RAW-PRE  all      *      *       ::/0                 ::/0
    1    56 LOG-RAW-OUT  all      *      *       ::/0                 ::/0
    0     0 LOG-FIL-IN-DROP  all      !lo    *       ::/0                 ::1
    0     0 LOG-FIL-IN-ACCEPT  all      lo     *       ::/0                 ::/0
    0     0 LOG-FIL-IN-ACCEPT  all      *      *       ::/0                 ::/0                 ctstate RELATED,ESTABLISHED
    0     0 LOG-FIL-IN-DROP  all      *      *       ::/0                 ::/0                 ctstate INVALID,NEW
    0     0 LOG-FIL-IN-DROP  all      *      *       ::/0                 ::/0
    0     0 LOG-FIL-FORWARD-DROP  all      *      *       ::/0                 ::/0
    0     0 LOG-FIL-OUT-ACCEPT  tcp      *      wlan0   ::/0                 ::/0                 tcp dpt:443 state NEW,ESTABLISHED
    0     0 LOG-FIL-OUT-ACCEPT  tcp      *      wlan0   ::/0                 ::/0                 tcp dpt:80 state NEW,ESTABLISHED
    0     0 LOG-FIL-OUT-ACCEPT  tcp      *      wlan0   ::/0                 ::/0                 tcp dpt:53 owner UID match 972
    0     0 LOG-FIL-OUT-ACCEPT  udp      *      wlan0   ::/0                 ::/0                 udp dpt:53 owner UID match 972
    0     0 LOG-FIL-OUT-ACCEPT  all      *      *       ::/0                 ::/64
    1    56 LOG-FIL-OUT-DROP  all      *      *       ::/0                 ::/0
UGLY-FIREWALL: [quit] [zero-counters] [flush] [base] [load] [policy] [ip4] [ip6] [log_lvl] [interfaces]
```

## Options
```shell
UGLY-FIREWALL: [quit] [zero-counters] [flush] [base] [load] [policy] [ip4] [ip6] [log_lvl] [interfaces]
```
- q quit
- z reset counters
- f delete all rules and chains
- b load base rules
- l load additional user rules or preconfigured firewalls
- p policy menu 
- 4 show/hide ip4
- 6 show/hide ip6
- g firewall log level
- i change interfaces
- r undocumented: list iptables rules

## How to make rulescripts

1. With a few lines to load the variables and config files from ugly-firewall like that:
```
#!/bin/bash
ACTION=$1
source $(dirname $0)/uf.config.sh
source $(dirname $0)/uf.config.interfaces.sh
echo -e "$ACT $(basename $0)"
```
2. with the iptables rules we desire, for example for dns:
```
$iptables $ACTION_OUTPUT -o $out_int -p udp -m udp --dport 53 -m owner --uid-owner unbound -j LOG-FIL-OUT-ACCEPT
$iptables $ACTION_OUTPUT -o $out_int -p tcp -m tcp --dport 53 -m owner --uid-owner unbound -j LOG-FIL-OUT-ACCEPT

$ip6tables $ACTION_OUTPUT -o $out_int -p udp -m udp --dport 53 -m owner --uid-owner unbound -j LOG-FIL-OUT-ACCEPT
$ip6tables $ACTION_OUTPUT -o $out_int -p tcp -m tcp --dport 53 -m owner --uid-owner unbound -j LOG-FIL-OUT-ACCEPT
```
3. and save it in the ugly-firewall directory with the name we want started with "rules.uf" so that uglu-firewall can find it and be available in the rule's loading menu.
```
rules.uf.output.dns.sh
```

## Files
```
uf --> main script
uf.config.sh --> variables config
uf.config.interfaces.sh --> interfaces config
iptables.* --> base firewall files
rules.uf.* --> rules to load
firewall.uf. --> preconfigured server firewalls to load

```


## Contributing and support

Please read [Contributor covenant](https://www.contributor-covenant.org/) for details, and  [code of conduct](https://www.contributor-covenant.org/version/2/0/code_of_conduct) before submitting pull requests or issues.

If you want to support this project with a donation, here is mi Bitcoin address:

1LMJZcpJiHkiYiHrqUZdmbHJyUvF5KUsdq

All donations are appreciated!

## Author

* **Viel Losero** - *Initial work* - [Viel Losero](https://github.com/VielLosero)

## License

This project is licensed under the BSD License - see the [LICENSE.md](LICENSE.md) file for details
