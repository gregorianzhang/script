#!/bin/bash

#roy@roy-office:~$ sudo ip route 
#default via 172.18.103.254 dev eth0  proto static 
#10.0.3.0/24 dev lxcbr0  proto kernel  scope link  src 10.0.3.1 
#172.17.0.0/16 dev docker0  proto kernel  scope link  src 172.17.42.1 
#172.18.102.0/23 dev eth0  proto kernel  scope link  src 172.18.102.2  metric 1 
#192.168.100.0/22 dev wlan0  proto kernel  scope link  src 192.168.102.113  metric 9 

ip route flush table 100
ip route add default via 172.18.103.254 dev eth0 table 100

ip route flush table 200
ip route add default via 192.168.103.254 dev wlan0 table 200

ip rule add from all to 45.33.50.0/24 lookup 200
ip rule add from all to 106.185.40.0/24 lookup 200

