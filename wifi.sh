ifconfig wlan0 down
iwconfig wlan0 mode monitor
ifconfig wlan0 up
airmon-ng start wlan0 &

sleep 5
airbase-ng -e pandora -c 1 mon0 & 

sleep 5
ifconfig at0 up
ifconfig at0 192.168.10.1 netmask 255.255.255.0
route add -net 192.168.10.0 netmask 255.255.255.0 gw 192.168.10.1

sleep 5
dhcpd -cf /etc/dhcp/dhcpd.conf -pf /var/run/dhcpd.pid at0


iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
iptables -A FORWARD -i wlan0 -o eth0 -j ACCEPT 
iptables -A FORWARD -p tcp --syn -s 192.168.10.0/24 -j TCPMSS --set-mss 1356


