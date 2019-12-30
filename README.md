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
git clone url                                                                                 

```shell
root@kali:~# git clone url 
```

## Running ugly-firewall

After cloning the repository change to iptables dir and run ./uf
Making a link to easy launch: ln -s path_to_iptables_uf /usr/bin/fw


```shell
root@kali:~# cd iptables/                                                                                                    
root@kali:~/iptables# ./fw                                                                      
                                                                                                                                                              
```

### Output While Running

```shell
ip4 pkts bytes target     prot opt in     out     source               destination
 7002 9017K LOG-RAW-PREROUTING  all  --  *      *       0.0.0.0/0            0.0.0.0/0           
 6784 5298K LOG-RAW-OUTPUT  all  --  *      *       0.0.0.0/0            0.0.0.0/0           
    0     0 LOG-DROP-INPUT  all  --  !lo    *       0.0.0.0/0            127.0.0.0/8         
 4103 4326K LOG-ACCEPT-INPUT  all  --  lo     *       0.0.0.0/0            0.0.0.0/0           
 2899 4692K LOG-ACCEPT-INPUT  all  --  *      *       0.0.0.0/0            0.0.0.0/0            ctstate RELATED,ESTABLISHED
    0     0 LOG-DROP-INPUT  all  --  eth0   *       0.0.0.0/0            0.0.0.0/0            state INVALID,NEW
    0     0 LOG-DROP-INPUT  all  --  *      *       0.0.0.0/0            0.0.0.0/0            ctstate INVALID
    0     0 LOG-DROP-INPUT  all  --  *      *       0.0.0.0/0            0.0.0.0/0           
    0     0 LOG-DROP-FORWARD  all  --  *      *       0.0.0.0/0            0.0.0.0/0           
 2041  661K LOG-ACCEPT-OUTPUT  all  --  *      eth0    0.0.0.0/0            0.0.0.0/0            owner UID match 127
  254 24774 LOG-ACCEPT-OUTPUT  tcp  --  *      eth0    0.0.0.0/0            0.0.0.0/0            tcp dpt:853
 4103 4326K LOG-ACCEPT-OUTPUT  all  --  *      lo      0.0.0.0/0            127.0.0.1           
    0     0 LOG-ACCEPT-OUTPUT  udp  --  *      *       0.0.0.0/0            0.0.0.0/0            udp spt:68
    0     0 LOG-ACCEPT-OUTPUT  icmp --  *      *       0.0.0.0/0            0.0.0.0/0           
  386  286K LOG-DROP-OUTPUT  all  --  *      *       0.0.0.0/0            0.0.0.0/0           
ip6 pkts bytes target     prot opt in     out     source               destination
   30  3078 LOG-RAW-PREROUTING  all      *      *       ::/0                 ::/0                
   31  3134 LOG-RAW-OUTPUT  all      *      *       ::/0                 ::/0                
    0     0 LOG-DROP-INPUT  all      !lo    *       ::/0                 ::1                 
   30  3078 LOG-ACCEPT-INPUT  all      lo     *       ::/0                 ::/0                
    0     0 LOG-ACCEPT-INPUT  all      *      *       ::/0                 ::/0                 ctstate RELATED,ESTABLISHED
    0     0 LOG-DROP-INPUT  all      eth0   *       ::/0                 ::/0                 state INVALID,NEW
    0     0 LOG-DROP-INPUT  all      *      *       ::/0                 ::/0                 ctstate INVALID
    0     0 LOG-DROP-INPUT  all      *      *       ::/0                 ::/0                
    0     0 LOG-DROP-FORWARD  all      *      *       ::/0                 ::/0                
    0     0 LOG-ACCEPT-OUTPUT  all      *      eth0    ::/0                 ::/0                 owner UID match 127
    0     0 LOG-ACCEPT-OUTPUT  tcp      *      eth0    ::/0                 ::/0                 tcp dpt:853
   30  3078 LOG-ACCEPT-OUTPUT  all      *      *       ::/0                 ::/64               
    0     0 LOG-ACCEPT-OUTPUT  udp      *      *       ::/0                 ::/0                 udp spt:546
    0     0 LOG-ACCEPT-OUTPUT  icmp     *      *       ::/0                 ::/0                
    1    56 LOG-DROP-OUTPUT  all      *      *       ::/0                 ::/0                
UGLY-FIREWALL: [quit] [zero-counters] [flush] [base] [load] [policy] [ip4] [ip6]
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
